<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderDetailForMember.aspx.cs" Inherits="OrderDetailForMember" %>

<asp:Content ID="Content3" ContentPlaceHolderID="CSSPlaceHolder" runat="server">
    <link href="theme-assets/css/core/menu/menu-types/vertical-menu.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <%-- 左邊區塊 --%>
        <div class="sidebar-detached sidebar-left">
            <div class="sidebar">
                <div class="bug-list-sidebar-content">
                    <!-- Predefined Views -->

                    <div class="card">
                        <div class="card-head">
                            <div class="align-self-center halfway-fab text-center p-1"></div>
                            <div class="text-center">
                                <%--會員姓名 --%>

                                <asp:Label class="font-medium-2 text-uppercase menu-title" ID="Label1" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <div class="card-body border-top-blue-grey border-top-lighten-5">
                            <!-- contacts view -->
                            <div class="card-body">
                                <div class="list-group">
                                    <%-- 換成asp button --%>
                                    <a href="#" class="list-group-item active menu-title">全部訂單</a>
                                    <a href="#" class="list-group-item list-group-item-action menu-title">新進訂單</a>
                                    <a href="#" class="list-group-item list-group-item-action menu-title">歷史訂單</a>
                                    <asp:Button ID="Button1" CssClass="list-group-item list-group-item-action menu-title" runat="server" Text="返回" Onclick="Button1_Click"/>
                                    <%-- <a href="#" class="list-group-item list-group-item-action info"><i class="mr-1 ft-plus"></i>Add Contacts</a>--%>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--/ Predefined Views -->

                </div>
            </div>
        </div>
        <%-- ------------------------------------ --%>
        <%-- 右邊區塊 --%>
        <div class="content-detached content-right">
            <div class="content-body">
                <section class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-head">
                                <div class="card-header">
                                    <h4 class="card-title"><%--All Contacts--%></h4>
                                    <a class="heading-elements-toggle">
                                        <i class="la la-ellipsis-h font-medium-3"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <!-- Task List table -->
                                    <div class="table-responsive">
                                        <div id="users-contacts_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                            <div class="row">
                                                <div class="col-sm-12 col-md-6">
                                                    <div id="users-contacts_filter" class="dataTables_filter">
                                                        <label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="users-contacts"></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6">
                                                    <div class="dataTables_length" id="users-contacts_length">
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:Repeater ID="Repeater1" runat="server">
                                                <HeaderTemplate>
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <table id="users-contacts" class="table table-white-space table-bordered table-striped row-grouping display no-wrap icheck table-middle dataTable no-footer" role="grid" aria-describedby="users-contacts_info">
                                                                <thead>
                                                                    <tr role="row">
                                                                        <th class="sorting_asc" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-sort="ascending" aria-label=": activate to sort column descending">訂單編號</th>
                                                                        <th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-label="Name: activate to sort column ascending">訂購日期</th>
                                                                        <th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending">收件人姓名</th>
                                                                        <th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-label="Phone: activate to sort column ascending">收件人電話</th>
                                                                        <th class="sorting" tabindex="0" aria-controls="users-contacts" rowspan="1" colspan="1" aria-label="Actions: activate to sort column ascending">訂單資訊</th>
                                                                    </tr>
                                                                </thead>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tbody>

                                                        <tr role="row" class="odd">
                                                            <td>9048000<%#Eval("OrderID")%></td>
                                                            <td><%#Eval("OrderDate")%></td>
                                                            <td><%#Eval("ShipName")%></td>
                                                            <td><%#Eval("Phone")%></td>
                                                            <td>
                                                                <button id="btnSearchDrop11" type="button" class="btn btn-sm btn-icon btn-pure font-medium-2" aria-haspopup="true"
                                                                    aria-expanded="false">
                                                                    <a href="<%#Eval("OrderID","/OrderDetail.aspx?id={0}") %> "><i class="ft-more-vertical" data-toggle="tooltip" data-original-title="訂單資訊"></i></a>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </tbody>


                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                    </div>
                                            </div>
                                                </FooterTemplate>
                                            </asp:Repeater>

                                            <%-- 頁數 --%>
                                            <div class="row">
                                                <div class="col-sm-12 col-md-5">
                                                    <div class="dataTables_info" id="users-contacts_info" role="status" aria-live="polite"><%--Showing 1 to 10 of 30 entries--%></div>
                                                </div>
                                                <div class="col-sm-12 col-md-7">
                                                    <div class="dataTables_paginate paging_simple_numbers" id="users-contacts_paginate">
                                                        <ul class="pagination">
                                                            <li class="paginate_button page-item previous disabled" id="users-contacts_previous"><a href="#" aria-controls="users-contacts" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
                                                            <li class="paginate_button page-item active"><a href="#" aria-controls="users-contacts" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
                                                            <li class="paginate_button page-item "><a href="#" aria-controls="users-contacts" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
                                                            <li class="paginate_button page-item "><a href="#" aria-controls="users-contacts" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
                                                            <li class="paginate_button page-item next" id="users-contacts_next"><a href="#" aria-controls="users-contacts" data-dt-idx="4" tabindex="0" class="page-link">Next</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </form>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptHolder" runat="Server">
</asp:Content>

