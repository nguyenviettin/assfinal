/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

//import entity.Staffs;
import entity.Departs;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author USER
 */
@Transactional
@Controller
@RequestMapping("/home")
public class ControllerDeparts {

    @Autowired
    SessionFactory factory;

    @ModelAttribute("GioiTinh")
    public Map<String, String> getMajors1() {
        Map<String, String> GioiTinh = new HashMap<>();
        GioiTinh.put("1", "Nam");
        GioiTinh.put("0", "Nữ");
        return GioiTinh;
    }

    @RequestMapping("departs")
    public String index(ModelMap model, @ModelAttribute("pb") Departs departs) {
        Session session = factory.getCurrentSession();
        String hql = "FROM Departs";
        Query query = session.createQuery(hql);
        List<Departs> list = query.list();
        model.addAttribute("departs", list);
        model.addAttribute("message", query);
        return "home/departs";
    }

    @RequestMapping("edit")
    public String edit(HttpServletRequest request, ModelMap model, Departs departs) {
        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        String email = request.getParameter("txtemail");
        String sdt = request.getParameter("txtsdt");
        String gt = request.getParameter("txtgt");
        departs.setId(id);
        departs.setName(name);
        departs.setEmail(email);
        departs.setSdt(sdt);
        departs.setGioitinh(Boolean.parseBoolean(gt));

        model.addAttribute("pb", departs);

        Session session = factory.getCurrentSession();
        String hql = "FROM Departs";
        Query query = session.createQuery(hql);
        List<Departs> list = query.list();
        model.addAttribute("departs", list);

        return "home/departs";
    }

    @RequestMapping(params = "btnUp")
    public String update(@ModelAttribute("pb") Departs departs, ModelMap model) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(departs);
            t.commit();

            Session session1 = factory.getCurrentSession();
            String hql1 = "FROM Departs";
            Query query1 = session1.createQuery(hql1);
            List<Departs> list = query1.list();
            model.addAttribute("departs", list);

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "that bai");
        } finally {
            session.close();
        }
        return "home/departs";
    }

    @RequestMapping(params = "btnIn")
    public String insertms(@ModelAttribute("pb") Departs departs, ModelMap model,BindingResult errors) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        
        Departs departs1 =new Departs(departs.getName(), departs.getEmail(), departs.getSdt(),departs.getGioitinh());
         if (departs.getName().equals("")) {
            errors.rejectValue("name", "login", "Vui Long nhap username");
        }  if (departs.getSdt().equals("")) {
            errors.rejectValue("email", "login", "Vui Long nhap email");
        }
        if (departs.getEmail().equals("")) {
            errors.rejectValue("sdt", "login", "Vui Long nhap PhoneNumber");
        } else {
        try {
            session.save(departs1);
            t.commit();

          

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "that bai" + e);
        } finally {
            session.close();
        }}
          Session session1 = factory.getCurrentSession();
            String hql1 = "FROM Departs";
            Query query1 = session1.createQuery(hql1);
            List<Departs> list = query1.list();
            model.addAttribute("departs", list);
        return "home/departs";
    }

    @RequestMapping(params = "bresset")
    public String reset(@ModelAttribute("pb") Departs departs, ModelMap model) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        departs.setId("Identity");
        departs.setName("");
        departs.setEmail("");
        departs.setSdt("");

        model.addAttribute("pb", departs);

        Session session1 = factory.getCurrentSession();
        String hql1 = "FROM Departs";
        Query query1 = session1.createQuery(hql1);
        List<Departs> list = query1.list();
        model.addAttribute("departs", list);

        return "home/departs";
    }

    @RequestMapping("del")
    public String delete(HttpServletRequest request, ModelMap model, @ModelAttribute("pb") Departs departs
    ) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        String id = request.getParameter("txtID");

        try {

            String hql1 = "delete from Departs where id= :aa";
            Query query1 = session.createQuery(hql1);
            query1.setString("aa", id);
            query1.executeUpdate();
            System.out.println(query1.executeUpdate());

            t.commit();
            return "redirect:/home/departs.html";
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "that bai");
        } finally {
            session.close();
        }
        return "home/departs";
    }

}
