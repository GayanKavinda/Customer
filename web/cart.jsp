<%@page import="pojo.OrderFood"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="pojo.Order"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from creative-wp.com/demos/majesty/boxed/shop_carts.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 26 Aug 2019 05:43:12 GMT -->
    <head>
        <!-- Meta Tags
            ============================================= -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Majesty by creative-wp - Responsive HTML5 template">
        <meta name="author" content="creative-wp">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Your Title Page
            ============================================= -->
        <title>Sanaya | Cart</title>
        <!-- Favicon Icons
             ============================================= -->
        <link rel="shortcut icon" href="img/favicon/favicon.ico">
        <!-- Standard iPhone Touch Icon-->
        <link rel="apple-touch-icon" sizes="57x57" href="img/favicon/apple-touch-icon-57x57.png">
        <!-- Retina iPhone Touch Icon-->
        <link rel="apple-touch-icon" sizes="114x114" href="img/favicon/apple-touch-icon-114x114.png">
        <!-- Standard iPad Touch Icon-->
        <link rel="apple-touch-icon" sizes="72x72" href="img/favicon/apple-touch-icon-72x72.png">
        <!-- Retina iPad Touch Icon-->
        <link rel="apple-touch-icon" sizes="144x144" href="img/favicon/apple-touch-icon-144x144.png">
        <!-- Bootstrap Links
             ============================================= -->
        <!-- Bootstrap CSS  -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Plugins
             ============================================= -->
        <!-- Owl Carousal -->
        <link rel="stylesheet" href="stylesheets/owl.carousel.css">
        <link rel="stylesheet" href="stylesheets/owl.theme.css">
        <!-- Animate -->
        <link rel="stylesheet" href="stylesheets/animate.css">
        <!-- Date Picker -->
        <link rel="stylesheet" href="stylesheets/jquery.datetimepicker.css">
        <!-- Pretty Photo -->
        <link rel="stylesheet" href="stylesheets/prettyPhoto.css">
        <!-- Font awsome icons -->
        <link rel="stylesheet" href="stylesheets/font-awesome.min.css">
        <!-- General Stylesheet
            ============================================= -->
        <!-- Custom Fonts Setup via Font-face CSS3 -->
        <link href="fonts/fonts.css" rel="stylesheet">
        <!-- Main Template Styles -->
        <link href="stylesheets/main.css" rel="stylesheet">
        <!-- Main Template Responsive Styles -->
        <link href="stylesheets/main-responsive.css" rel="stylesheet">
        <script type="text/javascript" src="custom/sweetalert.min.js"></script>
        <!--[if lt IE 9]>
              <script src="javascripts/libs/html5shiv.js"></script>
              <script src="javascripts/libs/respond.min.js"></script>
            <![endif]-->
    </head>
    <body class="boxed" >
        <!-- Loader
            ============================================= -->

        <!-- Document Wrapper
            ============================================= -->
        <div id="wrapper">
            <!-- banner 
              ============================================= -->
            <section class="banner dark" >
                <div id="cart-parallax">
                    <div class="bcg background39"
                         data-center="background-position: 50% 0px;"
                         data-bottom-top="background-position: 50% 100px;"
                         data-top-bottom="background-position: 50% -100px;"
                         data-anchor-target="#cart-parallax"
                         >
                        <div class="bg-transparent">
                            <div class="banner-content">
                                <div class="container" >
                                    <div class="slider-content  "> <i class="icon-home-ico"></i>
                                        <h1>Cart</h1>
                                        <p>Shop With Us</p>
                                        <ol class="breadcrumb">
                                            <li><a href="index.jsp">Home</a></li>
                                            <li>Cart</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                            <!-- End Banner content -->
                        </div>
                        <!-- End bg trnsparent -->
                    </div>
                </div>
                <!-- Service parallax -->
            </section>
            <!-- End Banner -->
            <!-- Header
              ============================================= -->
            <%@include file="header.jsp"%>
            <!-- End header -->
            <!-- Content
              ============================================= -->
            <div id="content">
                <!-- Carts
                ============================================= -->
                <section class="carts text-center padding-100">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <!-- Table carts -->
                                <table class="table table-striped table-responsive table-cart">
                                    <thead>
                                        <tr>
                                            <th style="width:40%">Product</th>
                                            <th style="width:15%">Price</th>
                                            <th style="width:20%">Quantity</th>
                                            <th style="width:25%">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%                                            Session sess = util.NewHibernateUtil.getSessionFactory().openSession();
                                            pojo.Customer customez = (pojo.Customer) request.getSession().getAttribute("userobj");
                                            Criteria cc = sess.createCriteria(pojo.Order.class);
                                            cc.add(Restrictions.eq("cid", customez.getCid()));
                                            cc.add(Restrictions.eq("status", "Pending"));

                                            pojo.Order customercart = (Order) cc.uniqueResult();
                                            double mulugana=0;
                                            int cartekeideka=customercart.getOrderId();
                                            if (customercart == null) {

                                            } else {
                                                System.out.println("Cart Ekak thiyanawa");
                                                Criteria criteria2 = sess.createCriteria(pojo.OrderFood.class);
                                                criteria2.add(Restrictions.eq("orderId", customercart.getOrderId()));
                                                List<pojo.OrderFood> orlist = criteria2.list();
                                                System.out.println(orlist.size());
                                                
                                                for (OrderFood Orderzf : orlist) {

                                                    int menuidz = Orderzf.getFoodId();
                                                    pojo.Menu mm = (pojo.Menu) sess.load(pojo.Menu.class, menuidz);

                                                    double totalprice = Orderzf.getQty() * mm.getPrice();
                                                    mulugana += totalprice;
                                        %>

                                        <tr>

                                            <td><a><%= mm.getFoodName()%></a> </td>
                                            <td>RS .<%= mm.getPrice()%> /=</td>
                                            <td><!-- input group minus & plus-->
                                                <div class="input-group plus-minus"> <span class="input-group-btn">
                                                        <button type="button" class="btn btn-default btn-number" onclick="decrecart(<%= Orderzf.getOfid()%>)"> <span class="fa fa-minus"></span> </button>
                                                    </span>
                                                    <input type="number" name="quant[1]" class="form-control input-number" value="<%= Orderzf.getQty()%>" min="1">
                                                    <span class="input-group-btn">
                                                        <button type="button" class="btn btn-default btn-number" onclick="incrececart(<%= Orderzf.getOfid()%>)"> <span class="fa fa-plus"></span> </button>
                                                    </span> </div>
                                                <!-- End input group minus & plus --></td>
                                            <td><span class="total">RS .<%= totalprice%>  /=</span></td>
                                            <td><span class="total"><button onclick="deletecart(<%= Orderzf.getOfid()%>)" class="btn btn-danger" >Delete From Cart</button></span></td>

                                        </tr>
                                        <%        }

                                            }

                                        %>
                                    </tbody>
                                </table>
                                <!-- End Table carts  -->
                            </div>
                            <!-- Carts content -->
<div class="col-md-12 carts-content">
            <div class="row">
              <!-- Left side -->
              <div class="col-md-5 left-side">
               
                <!-- Carts total -->
                <div class="carts-total text-left margin-tb-60">
                  <h3>Carts Total</h3>
                  <table class="table table-bordered">
                    <tbody>
                      <tr>
                        <td>Cart Net Total</td>
                        <td><%= mulugana %></td>
                      </tr>
                      
                    </tbody>
                  </table>
                </div>
                <!-- Carts total -->
              </div>
              <!-- End Left side -->
              <!-- Right side -->
              <div class="col-md-5 col-md-offset-2 right-side">
                <div class="form-group text-right checkout">
                  
                    <button type="submit" class="btn  btn-black" onclick="checkoutz(<%= cartekeideka %>,<%= mulugana %>)">PROCEED TO CHECKOUT</button>
                </div>
                <!-- Carts total -->
             
                <!-- Carts total -->
              </div>
              <!--End Right side -->
            </div>
          </div>
                            <!--End Carts content -->
                        </div>
                    </div>
                </section>
                <!-- End Carts -->
            </div>
            <!-- end of #content -->
            <!-- Footer
              ============================================= -->

            <!-- End footer -->
            <!--  scroll to top of the page-->
            <a href="#" id="scroll_up" ><i class="fa fa-angle-up"></i></a> </div>

        <script>

            function incrececart(zz) {


                var yewxmlhttp;
                if (window.XMLHttpRequest) {

                    yewxmlhttp = new XMLHttpRequest();


                } else {
                    yewxmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

                }

                yewxmlhttp.onreadystatechange = function() {


                    if (yewxmlhttp.readyState == 4 && yewxmlhttp.status == 200) {

                        var gett = yewxmlhttp.responseText;
                        //  alert(gett);
                        if (gett === "ok") {
                            //   alert("inside if");
                            swal("Done!", "Cart Updated..!", "success");
                            window.location = "cart.jsp";

                        }


                    }
                }

                yewxmlhttp.open("POST", "UpdateCart", true);
                yewxmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                yewxmlhttp.send("orfd=" + zz);



            }



            function decrecart(zz) {


                var yewxmlhttp;
                if (window.XMLHttpRequest) {

                    yewxmlhttp = new XMLHttpRequest();


                } else {
                    yewxmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

                }

                yewxmlhttp.onreadystatechange = function() {


                    if (yewxmlhttp.readyState == 4 && yewxmlhttp.status == 200) {

                        var gett = yewxmlhttp.responseText;
                        //  alert(gett);
                        if (gett === "ok") {
                            //   alert("inside if");
                            swal("Done!", "Cart Updated..!", "success");
                            window.location = "cart.jsp";

                        }
                        else if (gett === "dele") {
                            //   alert("inside if");
                            swal("Error!", "Please Remove this Item From Cart..!", "error");


                        }


                    }
                }

                yewxmlhttp.open("POST", "removefromcart", true);
                yewxmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                yewxmlhttp.send("orfd=" + zz);



            }


            function deletecart(zz) {

            
                var yewxmlhttp;
                if (window.XMLHttpRequest) {

                    yewxmlhttp = new XMLHttpRequest();


                } else {
                    yewxmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

                }

                yewxmlhttp.onreadystatechange = function() {


                    if (yewxmlhttp.readyState == 4 && yewxmlhttp.status == 200) {

                        var gett = yewxmlhttp.responseText;
                        //  alert(gett);
                        if (gett === "ok") {
                            //   alert("inside if");
                            swal("Done!", "Cart Updated..!", "success");
                            window.location = "cart.jsp";

                        }
                        


                    }
                }

                yewxmlhttp.open("POST", "deletecart", true);
                yewxmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                yewxmlhttp.send("orfd=" + zz);



            }
            
            
            function checkoutz(yy,vv){
                
               
                var yewxmlhttp;
                if (window.XMLHttpRequest) {

                    yewxmlhttp = new XMLHttpRequest();


                } else {
                    yewxmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

                }

                yewxmlhttp.onreadystatechange = function() {


                    if (yewxmlhttp.readyState == 4 && yewxmlhttp.status == 200) {

                        var gett = yewxmlhttp.responseText;
                        //  alert(gett);
                        if (gett === "ok") {
                            //   alert("inside if");
                            swal("Done!", "Order Compleate..!", "success");
                            window.location = "menus.jsp";

                        }
                        


                    }
                }

                yewxmlhttp.open("POST", "checkoutz", true);
                yewxmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                yewxmlhttp.send("orfd=" + yy+"&subz="+vv);


            }
        </script>
        <!-- End wrapper -->
        <!-- Core JS Libraries -->
        <script src="javascripts/libs/jquery.min.js" type="text/javascript"></script>
        <script src="javascripts/libs/plugins.js"></script>
        <!-- JS Plugins -->
        <script src="http://maps.googleapis.com/maps/api/js"></script>
        <script src="javascripts/libs/modernizr.js"></script>
        <!-- JS Custom Codes -->
        <script src="javascripts/custom/main.js" ></script>
    </body>

    <!-- Mirrored from creative-wp.com/demos/majesty/boxed/shop_carts.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 26 Aug 2019 05:43:25 GMT -->
</html>