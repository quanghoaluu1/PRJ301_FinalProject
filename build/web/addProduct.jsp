<%-- 
    Document   : addProduct
    Created on : Jun 17, 2024, 4:21:53 PM
    Author     : quang
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Products</title>
        <link rel="icon" type="image/x-icon" href="images/spi_logo.png">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
        <script>
            function alert(msg) {
                alert(msg);
            }
        </script>
    </head>
    <body>
        <div class="site-section">

            <div class="container">
                <form action="MainController" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">Add Product</h2>
                        </div>

                        <div class="col-md-7">

                            <div class="p-3 p-lg-5 border">
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="id" class="text-black">ID <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="id" name="prod-id">

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="name" class="text-black">Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="name" name="prod-name">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="category" class="text-black">Category <span class="text-danger">*</span></label>
                                        <select id="category" name="category">
                                            <option value="Laptop">Laptop</option>
                                            <option value="Phone">Phone</option>
                                            <option value="PC">PC</option>
                                            <option value="Keyboard">Keyboard</option>
                                            <option value="Mouse">Mouse</option>
                                            <option value="Headphone">Headphone</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="description" class="text-black">Description </label>
                                        <input type="text" class="form-control" id="description" name="description">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="brand" class="text-black">Brand </label>
                                        <input type="text" class="form-control" id="brand" name="brand">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="price" class="text-black">Price <span class="text-danger">*</span></label>
                                        <input type="number" step="0.01" class="form-control" id="price" name="price">
                                    </div>
                                </div>
                                                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="discount" class="text-black">Discount <span class="text-danger">*</span></label>
                                        <input type="number" step="0.01" class="form-control" id="discount" name="discount">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="stock" class="text-black">Stock <span class="text-danger">*</span></label>
                                        <input type="number"  class="form-control" id="stock" name="stock">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-5 ml-auto">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="image" class="text-black">Image </label>
                                    <input type="file" class="form-control" id="image" name="image" onchange="previewImage(event)">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <div style="width: 300px; height: 300px; overflow: hidden;">
                                        <img id="preview" src="" alt="Image preview..." style="max-width: 100%; max-height: 100%; display: none;">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-12">
                                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="add product" name="action">
                                </div>


                            </div>
                            <div class="form-group row">   
                                <div class="col-lg-12">
                                    <%
                                        String message = (String) request.getAttribute("msg");
                                        if (message == null) {
                                            message = "";
                                        }
                                    %>
                                    <c:set var="msg" value="${requestScope.msg}"/>
                                    <div class="d-flex justify-content-center">
                                        <h3 style="color: red;">${msg}</h3>
                                    </div>    

                                </div>
                            </div>
                        </div>

                    </div>
                </form>    
            </div>
        </div>
                                    
                                    <script>
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function() {
            var output = document.getElementById('preview');
            output.src = reader.result;
            output.style.display = 'block';
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>   
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
    </body>
</html>
