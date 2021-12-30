<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login_Admin.aspx.cs" Inherits="Login_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">


    <link href="LoginCss/css/main.css" rel="stylesheet" />
    <link href="LoginCss/css/util.css" rel="stylesheet" />
    <script src="LoginCss/js/main.js"></script>
    <script src="LoginCss/js/map-custom.js"></script>
    <style>
        .red {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="limiter">
                <div class="container-login100">
                    <div class="wrap-login100">
                        <div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
                            <span class="login100-form-title-1">Sign In
                            </span>
                        </div>

                        <div class="login100-form validate-form">
                            <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                                <span class="label-input100" onclick="_login()">使用者名稱:</span>
                                <asp:TextBox ID="TextBox1" CssClass="input100" runat="server"></asp:TextBox>

                                <span class="focus-input100"></span>

                            </div>

                            <div class="wrap-input100 validate-input m-b-18" data-validate="Password is required">
                                <span class="label-input100">密碼:</span>
                                <asp:TextBox ID="TextBox2" CssClass="input100" type="password" runat="server"></asp:TextBox>
                                <%--<input class="input100"  name="pass" placeholder="Enter password">--%>
                                <span class="focus-input100"></span>
                            </div>

                            <div class="flex-sb-m w-full p-b-30">
                                <div class="contact100-form-checkbox">

                                    <asp:CheckBox ID="ckb1" CssClass="input-checkbox100" runat="server" />

                                    <label class="label-checkbox100" for="ckb1">
                                        Remember me
                                    </label>
                                </div>

                                <div>
                                    <a href="#" class="txt1">Forgot Password?
                                    </a>
                                </div>
                            </div>

                            <div class="container-login100-form-btn">
                                <asp:Button ID="Button1" CssClass="login100-form-btn" runat="server" Text="Login" OnClick="Button1_Click" />
                                <asp:Label ID="Label1" CssClass="red" runat="server" Text=""></asp:Label>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>


</html>
<script>
 
</script>

