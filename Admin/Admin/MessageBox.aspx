<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MessageBox.aspx.cs" Inherits="MessageBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CSSPlaceHolder" runat="Server">
    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">

        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <br />
                                <h2 class="menu-title col-sm-4"><strong>客服管理</strong></h2>
                            </div>
                            <div class="col-sm-6"></div>
                        </div>

                    </div>
                    <table id="dataTable" class="table table-striped table-hover">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>

                                        <th>編號</th>
                                        <th>會員姓名</th>
                                        <th>主旨</th>
                                        <th>發問日期</th>
                                        <th>回覆日期</th>
                                        <th>編輯</th>

                                    </tr>
                                </thead>
                                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <input class="Hidden1" value="<%# Eval("ID") %>" type="hidden" />
                                    <%--<asp:HiddenField ID="HiddenField1" Value="<%# Eval("ID") %>" runat="server" />--%>
                                    <td><%# Eval("ID") %></td>
                                    <td><%# Eval("UserName") %></td>
                                    <td><%# Eval("Title") %></td>
                                    <td><%# Eval("QDate") %></td>
                                    <td><%# Eval("ADate") %></td>
                                    <td>
                                        <a href=' <%# Eval("ID","/MessageAnswer.aspx?id={0}") %>' class="edit"><i class="material-icons" data-toggle="tooltip" title="回覆">&#xE254;</i></a>
                                        <%--<button class="delete" onclick="return false;" data-toggle="tooltip" data-original-title="刪除" href="#deleteEmployeeModal"><i class="material-icons">&#xE872;</i></button>--%>
                                        <a href="#deleteEmployeeModal" class="delete" data-toggle="modal" onclick='return false;'><i class="material-icons" data-toggle="tooltip" data-original-title="刪除">&#xE872;</i></a>
                                        <input class="temp" type="hidden" />
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
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div>
                        <div class="modal-header ">
                            <h3 class="modal-title menu-title"><strong>刪除留言</strong></h3>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body ">
                            <h4 class="menu-title">確定要刪除這嗎?</h4>
                            <br />
                            <p class="text-warning"><small>刪除後將無法回復</small></p>
                        </div>
                        <div class="modal-footer menu-title">
                            <input type="button" id="delete1" class="btn btn-info" value="刪除">
                            <%--<asp:Button ID="Button1"  runat="server" CssClass="btn btn-info" Text="刪除" OnClick="Button1_Click" />--%>
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="Server">
    <script>
        $(() => {

            $("#dataTable").DataTable();

        });

        $(function () {
            var id;
            $(".delete").click(function () {
                id = $(this).parent().parent().find(".Hidden1").val();
            });
            $("#delete1").click(function () {
                var myId = id;
                var myData = {
                    id: myId
                };
                $.ajax({
                    type: 'POST',
                    url: "WebService.asmx/MessageDelete",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {

                        location.href = "MessageBox.aspx";
                    }


                })
            });




        });





    </script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
</asp:Content>

