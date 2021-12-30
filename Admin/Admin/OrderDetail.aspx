<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="OrderDetail" %>

<asp:Content ID="Content3" ContentPlaceHolderID="CSSPlaceHolder" runat="server">
    <style>
        @media print {
            body * {
                visibility: hidden;
            }

            .sectionToPrint, .sectionToPrint * {
                visibility: visible;
            }

            .sectionToPrint {
                position: absolute;
                left: 0;
                top: 0;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-outline-primary " Text="返回" OnClick="Button1_Click" />
        <input type="button" name="name" value="列印" class="btn btn-outline-primary " onclick="setPrint()" />
        <!-- BEGIN: Content-->
        <div class="app-content content sectionToPrint">
            <div class="content-header-right col-md-8 col-12">
                <div class="breadcrumbs-top float-md-right">
                    <div class="breadcrumb-wrapper mr-1">
                        <ol class="breadcrumb">
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div id="printDiv" class="content-body sectionToPrint">
            <section class="card">
                <div id="invoice-template" class="card-body">
                    <!-- Invoice Company Details -->
                    <div id="invoice-company-details" class="row">
                        <div class="col-md-6 col-sm-12 text-left text-md-left">
                            <ul class="px-0 list-unstyled">
                                <li>
                                    <img class="orderDetailImg" src="img/barcode.gif" />
                                </li>
                                <br />
                                <li class="text-bold-700">收件人姓名 :
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></li>
                                <li>收件人電話 :
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></li>
                                <li>收件人地址 :
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></li>
                                <li>電子郵件 :
                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></li>
                            </ul>

                        </div>
                        <div class="col-md-6 col-sm-12 text-center text-md-right">
                            <h2 class="menu-title">訂單編號</h2>
                            <p>
                                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                            </p>
                            <p>
                                下單日期 :
                            <asp:Label ID="Label6" CssClass="text-right" runat="server" Text="Label"></asp:Label>
                            </p>
                            <p>
                                出貨日期 :
                            <asp:Label ID="Label7" CssClass="text-right" runat="server" Text="Label"></asp:Label>
                            </p>


                        </div>
                    </div>
                    <!--/ Invoice Company Details -->
                    <div id="invoice-items-details" class="pt-2">
                        <div class="row">
                            <div class="table-responsive col-sm-12">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th class="menu-title">商品名稱</th>
                                                    <th class="text-right menu-title">數量</th>
                                                    <th class="text-right menu-title">單價</th>
                                                    <th class="text-right menu-title">小計</th>
                                                </tr>
                                            </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>
                                                    <%-- <p>Create Mobile Dashboard</p>--%>
                                                    <%#Eval("ProductName") %>
                                                </td>
                                                <td class="text-right"><%#Eval("Count")%></td>
                                                <td class="text-right"><%#Eval("Price") %></td>
                                                <td class="text-right"><%# String.Format("{0}",Convert.ToInt32(Eval("Count")) * Convert.ToInt32(Eval("Price"))) %></td>
                                            </tr>
                                        </tbody>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                        </div>
                    </div>
                                    </FooterTemplate>
                                </asp:Repeater>

                                <div class="row">
                                    <div class="col-md-7 col-sm-12 text-center text-md-left">
                                        <p class="lead menu-title">其他說明</p>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <table class="table table-borderless table-sm">
                                                    <tbody>
                                                        <tr>
                                                            <td>付款 :</td>
                                                            <td class="text-right">
                                                                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>取貨 :</td>
                                                            <td class="text-right">
                                                                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>優惠券名稱 :</td>
                                                            <td class="text-right">
                                                                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-5 col-sm-12">
                                        <p class="lead">總金額</p>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>商品小計 : </td>
                                                        <td class="text-right">$
                                                            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td>商品折扣 : </td>
                                                        <td class="pink text-right">
                                                            <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></td>
                                                    </tr>
                                                    <tr class="bg-grey bg-lighten-4">
                                                        <td class="text-bold-800">商品總計 : </td>
                                                        <td class="text-bold-800 text-right">$
                                                            <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptHolder" runat="Server">
    <script>
        function setPrint() {
            //var text = document.getElementById("printDiv").innerHTML;
            //var a = window.open('', '', 'height=500, width=500');
            //a.document.write('<html>');
            //a.document.write('<body > <h1>Div contents are <br>');
            //a.document.write(text);
            //a.document.write('</body></html>');
            //a.document.close();
            //a.print();
            window.print()
        }
    </script>
</asp:Content>

