<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberAddress.aspx.cs" Inherits="MemberAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <br />

        <div class="web-100">
            <div class="card">

                <div class="card-title">
                    <h2 class="menu-title col-sm-4"><strong>會員常用地址</strong></h2>

                    <div>
                        <div>
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body member_address">
                                        <div class="form">
                                            <div class="form-body">
                                                <div class="form-group">
                                                    <h5 class="menu-title">會員編號:</h5>
                                                    <asp:TextBox ID="TextBox1" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <h5 class="menu-title">會員姓名:</h5>
                                                    <asp:TextBox ID="TextBox2" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <h5 class="menu-title">會員地址:</h5>
                                                    <asp:TextBox ID="TextBox3" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>  
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- DB MemberShipping --%>
                                <div class="row memberAddress_row">
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-content collapse show">
                                                <div class="card-body">
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <asp:Repeater ID="Repeater1" runat="server">
                                                                <HeaderTemplate>
                                                                    <thead>
                                                                        <tr>
                                                                            
                                                                            <th>姓名</th>
                                                                            <th>手機號碼</th>
                                                                            <th>Email</th>
                                                                            <th>地址</th>
                                                                        </tr>
                                                                    </thead>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td><%# Eval("Name") %></td>
                                                                            <td><%# Eval("Phone") %></td>
                                                                            <td><%# Eval("Email") %></td>
                                                                            <td><%# Eval("Address") %></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </ItemTemplate>
                                                            </asp:Repeater> 
                                                            <asp:Button ID="Button1" CssClass="btn btn-outline-primary" runat="server" Text="返回" OnClick="Button1_Click" />
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- ////////////////////////////////////// --%>
                    </div>
                </div>
            </div>
        </div>

    </form>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptHolder" runat="Server">

    <script>

</script>
</asp:Content>

