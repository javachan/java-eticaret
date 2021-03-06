<%-- 
    Document   : reklamDuzenle
    Created on : Jul 7, 2015, 11:55:40 AM
    Author     : recepcoban
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="admin.data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%@include file="menu.jsp"%>
<%@include file="footer.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>
            Reklam Düzenleme
        </title>

        <link href="css/bulut.css" rel="stylesheet">
        <!-- Bootstrap Core CSS -->
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
        <!-- Timeline CSS -->
        <link href="dist/css/timeline.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="dist/css/sb-admin-2.css" rel="stylesheet">
        <!-- Morris Charts CSS -->
        <link href="bower_components/morrisjs/morris.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style type="text/css"></style>
        <link href="../css/skin.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/ckeditor_4.5.1_standard/ckeditor/ckeditor.js" charset="utf-8" type="text/javascript"></script>
    </head>
    <body>
        <div id="page-wrapper">

            <content style="padding: 40px 0px">

                <div class="text-right" style="margin-bottom: 25px">
                    <a href="reklam.jsp" class="btn btn-primary"><i class="glyphicon glyphicon-backward"> </i> Geri Dön</a>
                </div>

                <section>
                    <!-- İŞLEM MESAJ -->
                    <!-- İŞLEM MESAJ -->
                    <script>
                        function yonlendirBasarili() {
                            var page_url = window.location.href;
                            page_url = page_url.replace("&sonuc=basarili", "");
                            window.location.href = page_url;
                        }
                        ;

                        function yonlendirBasarisiz() {
                            var page_url = window.location.href;
                            page_url = page_url.replace("&sonuc=basarisiz", "");
                            window.location.href = page_url;
                        }
                        ;
                    </script>
                    <%
                        data ns = new data();
                        boolean dDurum = (request.getParameter("duzenleID") == null);
                        if (!dDurum) {
                            // vt sorgusu
                            ResultSet rss = null;
                            String aid = request.getParameter("duzenleID");
                            try {
                                rss = ns.baglan().executeQuery("select * from reklamlar where id = '" + aid + "' ");
                                rss.next();
                            } catch (Exception ex) {

                            }


                    %>


                    <div class="panel panel-primary" style="width: 75%; margin: 0 auto; margin-bottom: 50px">
                        <div class="panel-heading">
                            <h4 class="panel-title text-center">Reklam Düzenleme</h4>
                        </div>
                        <div class="panel-body">
                            <p class="text-center">Reklam Bilgilerinizi Düzenleyebilirsiniz.</p>
                            <hr>
                            <form class="form-horizontal" action="reklamDuzenleAction.jsp" method="post" style="width: 90%; margin: 0 auto;"
                                  <!-- reklam adı -->
                                  <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="adi">Reklam Adı</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" id="adi" name="adi" value="<% out.print(rss.getString("adi")); %>" class="form-control" required="">
                                        </div>
                                    </div>
                                </div>
                                <!-- Gösterim Sayısı -->
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="gosterim">Gösterim Sayısı</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" id="gosterim" name="gosterim" value="<% out.print(rss.getString("gosterim")); %>" class="form-control" required="">
                                        </div>
                                    </div>
                                </div>
                                <!-- Başlangıç Tarihi -->
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="baslangic">Başlangıç Tarihi</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="datetime"  value="<% out.print(rss.getString("bas_tarih")); %>" name="baslangic" id="baslangic" class="form-control" required="">
                                        </div>
                                    </div>
                                </div>
                                <!-- bitis Tarihi -->
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="bitis">Bitiş Tarihi</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="datetime" value="<% out.print(rss.getString("bit_tarih")); %>" name="bitis" id="bitis" class="form-control" required="">
                                        </div>
                                    </div>
                                </div>
                                <!-- Reklam Görseli -->
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="dosya">Reklam Görseli</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" name="dosya" value="<% out.print(rss.getString("resim")); %>" id="dosya" class="form-control" required="">
                                        </div>
                                    </div>
                                </div>
                                <!-- Reklam Genişlik -->
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="genislik">Reklam Genişlik</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" id="genislik" name="genislik" value="<% out.print(rss.getString("reklam_x")); %>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <!-- Reklam Yükseklik -->
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="yukseklik">Reklam Yükseklik</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" id="yukseklik" name="yukseklik" value="<% out.print(rss.getString("reklam_y")); %>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <!-- Reklam link -->
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="link">Reklam Linki</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input type="text" id="link" name="link" value="<% out.print(rss.getString("link")); %>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <!-- Durum -->
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="durum">Durum</label>
                                        </div>
                                        <div class="col-md-9">
                                            <% String select1, select2;

                                                if (rss.getString("durum").equals("0")) {
                                                    select1 = "selected";
                                                    select2 = "";
                                                } else {
                                                    select1 = "";
                                                    select2 = "selected";
                                                }
                                            %>
                                            <select class="form-control" required="required"name="durum" id="durum" >

                                                <option value="0" <% out.print(select1); %>>Pasif</option>
                                                <option value="1" <% out.print(select2); %>>Aktif</option>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- Buton -->
                                <div class="form-group" >
                                    <div class="row">
                                        <div class="col-md-3"> </div>
                                        <div class="col-md-9 text-right">
                                            <input type="hidden" name="dID" value="<% out.print(rss.getString("id")); %>"/>
                                            <input type="submit" value="Kaydet" name="duzenle" class="btn btn-primary">
                                            <a class="btn btn-danger" href="reklam.jsp">İptal</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%}%>
                        </div>
                        <div class="panel-footer"></div>
                    </div>
                </section>


            </content>
        </div>
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>
        <script src="bower_components/raphael/raphael-min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/dataTables.bootstrap.js"></script>
        <script src="dist/js/sb-admin-2.js"></script>            

    </body>
</html>
