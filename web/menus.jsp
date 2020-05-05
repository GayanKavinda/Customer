<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from creative-wp.com/demos/majesty/boxed/menu_list.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 26 Aug 2019 05:39:53 GMT -->
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
        <title>Sanaya | Menu</title>
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
        <!--[if lt IE 9]>
              <script src="javascripts/libs/html5shiv.js"></script>
              <script src="javascripts/libs/respond.min.js"></script>
            <![endif]-->
    </head>
    <body class="boxed">
        <!-- Loader
            ============================================= -->

        <!-- End Loader -->
        <!-- Document Wrapper
            ============================================= -->
        <div id="wrapper">
            <!-- banner 
              ============================================= -->
            <section class="banner dark" >
                <div id="menu-parallax">
                    <div class="bcg background41"
                         data-center="background-position: 50% 0px;"
                         data-bottom-top="background-position: 50% 100px;"
                         data-top-bottom="background-position: 50% -100px;"
                         data-anchor-target="#menu-parallax"
                         >
                        <div class="bg-transparent">
                            <div class="banner-content">
                                <div class="container" >
                                    <div class="slider-content  "> <i class="icon-home-ico"></i>
                                        <h1>Menu</h1>
                                        <p>Your Taste is Our Goal</p>
                                        <ol class="breadcrumb">
                                            <li><a href="index.jsp">Home</a></li>
                                            <li>Menu List</li>
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
            <header id="header" class="header-transparent">
                <div class="container">
                    <div class="row">
                        <div id="main-menu-trigger"><i class="fa fa-bars"></i></div>
                        <!-- Logo
                                    ============================================= -->
                        <div id="logo"> <a href="index.jsp" class="light-logo"><img src="img/logo.png" alt="Logo"></a> <a href="index.jsp" class="dark-logo"><img src="img/logo_dark.png" alt="Logo"></a> </div>
                        <!-- #logo end -->
                        <!-- Primary Navigation
                                    ============================================= -->
                        <%@include file="header.jsp" %>
                        <!-- #main-menu end -->
                    </div>
                </div>
            </header>
            <!-- End header -->
            <!-- Content
              ============================================= -->
            <div id="content">
                <!-- Menu Grid
                ============================================= -->
                <div class="menu_list  text-center">
                    <!-- Menu Items - Break Fast
                    ============================================= -->
                    <section>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 padding-t-100 padding-b-60"> 
                                    <!-- Head Title -->
                                    <div class="head_title">
                                        <i class="icon-breakfast icon-large"></i>
                                        <h1>Menus</h1>
                                        <span class="welcome">Order from 7.00am to 10.00 pm</span>
                                    </div>
                                    <!-- End# Head Title -->

                                    <!-- Menu Content -->
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <!-- Menu Items  Content -->
                                <!-- Menu Item -->
                                <%              
                                Session ses = util.NewHibernateUtil.getSessionFactory().openSession();
                                    Criteria cc = ses.createCriteria(pojo.Foodrecipie.class);
                                    List<pojo.Foodrecipie> menuz = cc.list();

                                    for (pojo.Foodrecipie mm : menuz) {

                                        int ii = mm.getFoodId();
                                        System.out.print("foddd id eka"+ii);
                                        Criteria cri = ses.createCriteria(pojo.Menu.class);
                                        cri.add(Restrictions.eq("foodId", ii));
                                        
                                        pojo.Menu vv =(pojo.Menu) cri.uniqueResult();
                                %>

                                <article class="menu-item-list col-md-12 col-sm-12" onclick="loadsinglemeenu(<%= mm.getFoodId() %>)">
                                    <h3 onclick="loadsinglemeenu(<%= mm.getFoodId() %>)"><a onclick="loadsinglemeenu(<%= mm.getFoodId() %>)"><%= mm.getFoodName()%></a> <span class="label red"> <%= vv.getMenuType() %></span> 
                                        <span class="price">R.S. <%=  vv.getPrice()%> /=</span>
                                        
                                    </h3>

                                </article>
                                <%
                                    }
                                %>
                                <!-- End Menu Item -->
                                <!-- End Menu Content -->
                            </div>
                        </div>
                    </section>

                    <!-- #menu end -->
                </div>
                <!-- End Menu Grid -->
            </div>
                                <script>
                                    function loadsinglemeenu(ff){
                                        window.location= "Singlemenudetails.jsp?menuid="+ff;
                                    }
                                    
                                </script> 
            <!-- end of #content -->
            <!-- Footer
                ============================================= -->
            <%@include file="footer.jsp" %>
            <!-- End footer -->
            <!--  scroll to top of the page-->
            <a href="#" id="scroll_up" ><i class="fa fa-angle-up"></i></a> </div>
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

    <!-- Mirrored from creative-wp.com/demos/majesty/boxed/menu_list.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 26 Aug 2019 05:40:10 GMT -->
</html>