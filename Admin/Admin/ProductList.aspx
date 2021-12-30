<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>
<asp:Content ID="Content3" ContentPlaceHolderID="CSSPlaceHolder" runat="server">
    <link href="dist/sweetalert.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <br />
                                <h2 class="menu-title col-sm-4"><strong>產品管理</strong></h2>
                            </div>
                            <div class="col-sm-6">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning material-icons" Text="新增產品" OnClick="Button1_Click" />
                                <%-- 匯出EXCEL檔 --%>
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-info material-icons" Text="匯出檔案"  OnClick="Button2_Click"/>
                            </div>
                        </div>
                       
                    </div>
                    <table id="dataTable" class="table table-striped table-hover">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>

                                        <th>編號</th>
                                        <th>圖片</th>
                                        <th>名稱</th>
                                        <th>類別</th>
                                        <th>顏色</th>
                                        <th>標籤</th>
                                        <th>價錢</th>
                                        <th>庫存</th>
                                        <th>細項</th>
                                        <th>編輯</th>

                                    </tr>
                                </thead>
                                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ProductID") %></td>
                                    <td> <img class="listImage" src='<%# Eval("ImageFile","/img/product/allProducts/{0}.jpg") %>' alt="" ></td>
                                    <td><%# Eval("ProductName") %></td>
                                    <td><%#ChangeText(Eval("ProductCategory"))%></td>
                                    <td><%# Eval("Color") %></td>
                                    <td><%# Eval("Tags") %></td>
                                    <td><%# Eval("Price") %></td>
                                    <td><%# Eval("Count") %></td>
                                    <td><%--<%# Eval("ProductDetail") %>--%>
                                        <a href='<%# Eval("ProductID","/ProductDetail.aspx?id={0}")  %>'' class="detail" ><i class="material-icons" data-toggle="tooltip" title="詳細資料">&#xe235;</i></a>
                                    </td>

                                    <td>
                                       <a href=' <%# Eval("ProductId","/ProductEdit.aspx?id={0}") %>' class="edit" ><i class="material-icons" data-toggle="tooltip" title="修改">&#xE254;</i></a>
                                       <a href=' <%# Eval("ProductId","/ProductDelete.aspx?id={0}") %>' class="delete" onclick="check" ><i class="material-icons" data-toggle="tooltip" data-original-title="刪除">&#xE872;</i></a>
                                    </td>
                                </tr>


                                </tbody>
                            </ItemTemplate>
                            <FooterTemplate></FooterTemplate>
                        </asp:Repeater>


                    </table>
                    <div class="clearfix">
                        <%--<div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>--%>
                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Previous</a></li>
                            <li class="page-item active"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item "><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

     

    </form>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptHolder" runat="Server">
    <script>

        //function check() {
        //    swal({
        //        title: '確認?',
        //        text: "檔案即將被刪除!",
        //        type: 'question',
        //        showCancelButton: true,
        //    });
        //}

    </script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>

