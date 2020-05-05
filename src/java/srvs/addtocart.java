/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package srvs;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import pojo.Order;
import pojo.OrderFood;

/**
 *
 * @author nuwan
 */
public class addtocart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String menuidz = request.getParameter("menuidz");
            int usermenuidz = Integer.parseInt(menuidz);
            pojo.Customer customez = (pojo.Customer) request.getSession().getAttribute("userobj");
            System.out.printf("Comes To Servlett...!");
            if (customez == null) {
                response.getWriter().write("userz");
            } else {
                Session sess = util.NewHibernateUtil.getSessionFactory().openSession();
                Transaction tc = sess.beginTransaction();

                pojo.Menu mm = (pojo.Menu) sess.load(pojo.Menu.class, Integer.parseInt(menuidz));

                Date dd = new Date();
                SimpleDateFormat todaydate = new SimpleDateFormat("yyyy/MM/dd");
                String today = todaydate.format(dd);

                SimpleDateFormat todaytimez = new SimpleDateFormat("hh:mm:ss");
                String totime = todaytimez.format(dd);

                Criteria cc = sess.createCriteria(pojo.Order.class);
                cc.add(Restrictions.eq("cid", customez.getCid()));
                cc.add(Restrictions.eq("status", "Pending"));

                pojo.Order customercart = (Order) cc.uniqueResult();
                // Cart ekak thiyeda nathida naththam
                if (customercart == null) {

                    System.out.println("Cart ekak na");
                    pojo.Order orderz = new pojo.Order();
                    orderz.setDate(today);
                    orderz.setTime(totime);
                    orderz.setCid(customez.getCid());
                    orderz.setStatus("Pending");

                    sess.save(orderz);

                    pojo.OrderFood orderfd = new pojo.OrderFood();
                    orderfd.setOrderId(orderz.getOrderId());
                    orderfd.setFoodId(mm.getMenuId());
                    orderfd.setQty(1);

                    sess.save(orderfd);

                    response.getWriter().write("ok");

                } else {
                    System.out.println("Cart Ekak thiyanawa");
                    Criteria criteria2 = sess.createCriteria(pojo.OrderFood.class);
                    criteria2.add(Restrictions.eq("orderId", customercart.getOrderId()));
                    List<pojo.OrderFood> orlist = criteria2.list();
                    System.out.println(orlist.size());

                    for (OrderFood Orderzf : orlist) {

                        int menuideka = Orderzf.getFoodId();

                        if (menuideka == usermenuidz) {

                            Orderzf.setQty(Orderzf.getQty() + 1);
                            sess.update(Orderzf);
                            System.out.println("if ekeeeeeeeeeeee");
                            break;
                        } else {
                            pojo.OrderFood orderfd = new pojo.OrderFood();
                            orderfd.setOrderId(customercart.getOrderId());
                            orderfd.setFoodId(mm.getMenuId());
                            orderfd.setQty(1);
                            sess.save(orderfd);
                            System.out.println("else ekeeeeeeeeeeee");
                            break;
                        }

                    }

                    response.getWriter().write("updated");
                }
                tc.commit();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
