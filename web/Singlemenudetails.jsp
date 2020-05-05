<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from creative-wp.com/demos/majesty/boxed/menu_single.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 26 Aug 2019 05:40:37 GMT -->
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
        <title>Sanaya | Single Menu</title>
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

        <!-- End loader -->
        <!-- Document Wrapper
            ============================================= -->
        <div id="wrapper">
            <!-- banner 
              ============================================= -->
            <section class="banner about dark" >
                <div id="menu-single-parallax">
                    <div class="bcg background42"
                         data-center="background-position: 50% 0px;"
                         data-bottom-top="background-position: 50% 100px;"
                         data-top-bottom="background-position: 50% -100px;"
                         data-anchor-target="#menu-single-parallax"
                         >
                        <div class="bg-transparent">
                            <div class="banner-content">
                                <div class="container" >
                                    <div class="slider-content  "> <i class="icon-home-ico"></i>
                                        <h1>Menu</h1>
                                        <p>Come & Taste</p>
                                        <ol class="breadcrumb">
                                            <li><a href="index.jsp">Home</a></li>
                                            <li><a href="menu_grid.html">Menu</a></li>
                                            <li>Single Menu</li>
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
            <div id="content">
                <!-- Single menu
                  ============================================= -->
                <section class="single-menu text-left padding-100">
                    <div class="container">
                        <div class="row">
                            <!-- Menu thumb slider -->
                            <%                                String foodiz = request.getParameter("menuid");

                                Session gg = util.NewHibernateUtil.getSessionFactory().openSession();
                                pojo.Foodrecipie fre = (pojo.Foodrecipie) gg.load(pojo.Foodrecipie.class, Integer.parseInt(foodiz));
                                Criteria cri2 = gg.createCriteria(pojo.Menu.class);
                                cri2.add(Restrictions.eq("foodId", fre.getFoodId()));

                                pojo.Menu vv = (pojo.Menu) cri2.uniqueResult();


                            %>
                            <!--End Menu thumb slider -->
                            <!-- Menu Desc -->
                            <div class="menu-desc col-md-12">
                                <h2><%= fre.getFoodName()%><span class="pull-right">R.S <%= vv.getPrice()%> /=</span></h2>
                                <!-- Rating -->
                                <fieldset class="rating">
                                    <span class="active">
                                        <i class="fa fa-star"></i></span> <span class="active"><i class="fa fa-star"></i></span> <span class="active"><i class="fa fa-star"></i></span> <span class="active"><i class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
                                    <button  id="bt1" class="btn btn-success" onclick="Addtocart(<%= vv.getMenuId()%>)">Add To Cart</button>
                                </fieldset>
                                <!-- End Rating -->
                                <!-- Tagged -->
                                <div class="tagged">
                                    <%
                                        Criteria cc = gg.createCriteria(pojo.ItemFood.class);
                                        cc.add(Restrictions.eq("foodId", fre.getFoodId()));
                                        List<pojo.ItemFood> itemz = cc.list();

                                        for (pojo.ItemFood it : itemz) {
                                            int itemid = it.getItemId();
                                            pojo.Item iteff = (pojo.Item) gg.load(pojo.Item.class, itemid);
                                    %>
                                    <span class="label red"><%= iteff.getName()%></span> 
                                    <%                                      }
                                    %>  
                                </div>
                                <!-- Ends Tagged -->
                                <!-- Description content -->
                                <div class="desc-content">

                                    <!-- Meta description -->

                                    <!--End Meta description -->
                                </div>
                                <!--End Description content -->
                            </div>
                            <!--End Menu Desc -->

                            <!-- tab panel -->
                        </div>
                    </div>
                </section>
                <!-- End single menu -->
                <!-- Interest
                ============================================= -->
                <script>

                    function Addtocart(ee) {
                     
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


                                    swal("Done!", "Item Added To cart..!", "success");
                                    window.loacation = "menus.jsp";
                                } else if (gett === "userz") {


                                    swal("Error..!", "Please Login To Continue..!", "error");
                                    window.location = "login.jsp";
                                }
                                else if (gett === "updated") {


                                    swal("Done!", "Cart Updated..!", "success");
                                    window.loacation = "menus.jsp";
                                }


                            }
                        }

                        yewxmlhttp.open("POST", "addtocart", true);
                        yewxmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                        yewxmlhttp.send("menuidz=" + ee);



                    }


                </script>
                <!-- End Interest -->
            </div>
            <!-- End #content -->
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


</html>