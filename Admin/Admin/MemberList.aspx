<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberList.aspx.cs" Inherits="MemberList" %>

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
                                <h2 class="menu-title col-sm-4"><strong>會員管理</strong></h2>
                            </div>
                            <div class="col-sm-6">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning material-icons" Text="新增會員" OnClick="Button1_Click" />
                                <%-- 匯出EXCEL檔 --%>
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-info material-icons" Text="匯出檔案" OnClick="Button2_Click" />
                                <asp:GridView ID="GridView1" runat="server" />

                            </div>
                        </div>

                    </div>
                    <table id="dataTable" class="table table-striped table-hover">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>

                                        <th>編號</th>
                                        <th>姓名</th>
                                        <th>密碼</th>
                                        <th>性別</th>
                                        <th>生日</th>
                                        <th>手機</th>
                                        <th>E-mail</th>
                                        <th>接受消息</th>
                                        <th>加入會員日期</th>
                                        <th>備註</th>
                                        <th>地址</th>
                                        <th>訂單</th>
                                        <th>編輯</th>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr>

                                        <td><%# Eval("MemberID") %></td>
                                        <td><%# Eval("UserName") %></td>
                                        <td><%# Eval("Password") %></td>
                                        <td><%#ChangeText( Eval("Gender")) %></td>
                                        <td><%# Eval("BirthDate","{0:yyyy/MM/dd}") %></td>
                                        <td><%# Eval("Phone") %></td>
                                        <td><%# Eval("Email") %></td>
                                        <td><%# Eval("EDM") %></td>
                                        <td><%# Eval("JoinDate","{0:yyyy/MM/dd}") %></td>
                                        <td><%# Eval("Remark") %></td>
                                        <td><%--<%# Eval("Address") %>--%>
                                            <a href=' <%# Eval("MemberID","/MemberAddress.aspx?id={0}") %>' class="detail"><i class="material-icons" data-toggle="tooltip" title="常用地址">&#xe88a;</i></a>

                                        </td>
                                        <td><%--<%# Eval("OrderList") %>--%>
                                            <a href=' <%# Eval("MemberID","/OrderDetailForMember.aspx?id={0}") %>' class="detail"><i class="material-icons" data-toggle="tooltip" title="訂單資訊">&#xe235;</i></a>
                                        </td>
                                        <td>

                                            <a href="#editEmployeeModal" class="edit" data-toggle="modal" onclick='aa(<%#Eval("MemberID") %>)'><i class="material-icons" data-toggle="tooltip" title="修改">&#xE254;</i></a>
                                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal" onclick='aa(<%#Eval("MemberID") %>)'><i class="material-icons" data-toggle="tooltip" data-original-title="刪除">&#xE872;</i></a>
                                        </td>
                                    </tr>


                                </tbody>
                            </ItemTemplate>
                            <FooterTemplate></FooterTemplate>
                        </asp:Repeater>



                    </table>
                    <div class="clearfix">
                        <%--  <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>--%>
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


        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div>
                        <div class="modal-header ">
                            <h3 class="modal-title menu-title"><strong>修改會員</strong></h3>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body menu-title ">

                            <div class="form-group">
                                <label>編號</label>
                                <input id="Text1" class="form-control" disabled="disabled" runat="server" />
                                <br />
                                <div class="form-group">
                                    <label>姓名</label>
                                    <input id="Text2" class="form-control" runat="server" type="text" />
                                </div>
                                <div class="form-group">
                                    <label>手機</label>
                                    <input id="Text6" class="form-control" runat="server" type="tel" />
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input id="Text7" class="form-control" runat="server" type="email" />
                                </div>
                                <div class="form-group">
                                    <label>地址</label>
                                    <input id="Text8" class="form-control" runat="server" type="text" />
                                </div>
                                <div class="form-group">
                                    <label onclick="_remark()">備註</label>
                                    <input id="Text11" class="form-control" runat="server" type="text" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <input type="button" id="save" class="btn btn-info" value="儲存">
                            <input type="button" id="cancel" class="btn btn-default" data-dismiss="modal" value="取消">
                        </div>
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
                            <h3 class="modal-title menu-title"><strong>刪除會員</strong></h3>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body ">
                            <h4 class="menu-title">確定要刪除這位會員嗎?</h4>
                            <br />
                            <p class="text-warning"><small>刪除後將無法回復</small></p>
                            <input id="Hidden1" type="hidden" />
                        </div>
                        <div class="modal-footer menu-title">
                            <input type="button" id="delete1" class="btn btn-info" value="刪除">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptHolder" runat="Server">
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    

    <script>

        function aa(id) {

            $.ajax({

                type: 'POST',
                url: "WebService.asmx/GetMember",
                async: false,
                contentType: "application/json;utd-8",
                dataType: "json",
                data: JSON.stringify({ "id": id }),
                success: function (result) {

                    $("#ContentPlaceHolder1_Text1").val(result.d.MemberID);
                    $("#ContentPlaceHolder1_Text2").val(result.d.UserName);
                    $("#ContentPlaceHolder1_Text6").val(result.d.Phone);
                    $("#ContentPlaceHolder1_Text7").val(result.d.Email);
                    $("#ContentPlaceHolder1_Text8").val(result.d.Address);
                    $("#ContentPlaceHolder1_Text11").val(result.d.Remark);
                }
            });
            $("#save").click(function () {

                var mydata = {

                    memberId: $("#ContentPlaceHolder1_Text1").val(),
                    userName: $("#ContentPlaceHolder1_Text2").val(),
                    phone: $("#ContentPlaceHolder1_Text6").val(),
                    email: $("#ContentPlaceHolder1_Text7").val(),
                    address: $("#ContentPlaceHolder1_Text8").val(),
                    remark: $("#ContentPlaceHolder1_Text11").val(),

                };

                $.ajax({

                    type: 'POST',
                    url: "WebService.asmx/Update",
                    async: false,
                    contentType: "application/json;utd-8",
                    dataType: "json",
                    data: JSON.stringify(mydata),
                    success: function (result) {
                        swal("儲存成功!", "", "success").then(function () {
                            window.location.href = "MemberList.aspx"
                        });
                       
                        //swal({
                        //    title: '確認?',
                        //    text: "檔案即將被刪除!",
                        //    type: 'warning',
                        //    showCancelButton: true,
                        //}).then(
                        //    function () {
                        //        window.location.href = "MemberList.aspx";
                        //    }
                        //);

                        //alert("修改成功")
                        //location.href = "MemberList.aspx"
                        //success: function (result)       
                    }
                })
            })

            $("#delete1").click(function () {
                var mydata = {
                    memberId: $("#ContentPlaceHolder1_Text1").val(),
                };

                $.ajax({

                    type: 'POST',
                    url: "WebService.asmx/Delete",
                    async: false,
                    contentType: "application/json;utd-8",
                    dataType: "json",
                    data: JSON.stringify(mydata),
                    success: function (result) {
                        swal("刪除成功!", "", "success").then(function () {
                            window.location.href = "MemberList.aspx"
                        });
                        /*  location.href = "MemberList.aspx";*/
                    }
                })
                //swal({
                //    title: '確認?',
                //    text: "檔案即將被刪除!",
                //    type: 'warning',
                //    showCancelButton: true,
                //}).then(
                //function () {

                //    //2.搭配MasterPage之後,伺服器控制項Render出來的標籤,id與name會不一樣
                //    $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$Button1");

                //    $("#form1").submit();


                //},
                //function (dismiss) {
                //    if (dismiss === 'cancel') {
                //        swal('取消', '檔案未被刪除', 'error')
                //    }
                //});

            })

            //if ($("#ContentPlaceHolder1_HiddenField1").val() == "ok") {
            //    swal('完成', '檔案已經刪除', 'success')

            //}
        }// HiddenField1.Value = "ok";
        function _remark() {
            $("#ContentPlaceHolder1_Text11").val("黑名單");
        }

    </script>





</asp:Content>

