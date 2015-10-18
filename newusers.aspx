<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newusers.aspx.cs" Inherits="newusers" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strconnect;

        Label1.Text = MapPath(".");
        
        strconnect = "Provider=microsoft.jet.oledb.4.0;";
        strconnect += "data source=" + MapPath(".\\tutorbookingsystem.mdb");
        strconnect += ";persist security info=false";
        System.Data.OleDb.OleDbConnection
        DBConnection = new System.Data.OleDb.OleDbConnection(strconnect);
        DBConnection.Open();
        System.Data.OleDb.OleDbCommand
        DBCommand = new OleDbCommand();
        DBCommand.CommandType = CommandType.Text;
        DBCommand.CommandText = "INSERT INTO [users] ([username], [firstname], [surname], [password], [confirmpassword]) VALUES ('" + username.Text + "','" + firstname.Text + "','" + surname.Text + "','" + password.Text + "','" + confirmpassword.Text + "')";
        DBCommand.Connection = DBConnection;
        DBCommand.ExecuteNonQuery(); //for INSERT, DELETE, UPDATE, CREATE,..
        DBConnection.Close();
        Response.Redirect("login.aspx"); 
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>tutorbookingsystem</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div>
    </div>
    <form id="form1" runat="server">
        
        Create New Account<br />
        <br />
        username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="username" runat="server" Width="257px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <br />
        <br />
&nbsp;firstname&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="firstname" runat="server" Width="227px"></asp:TextBox>
        <br />
        <br />
        surname&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="surname" runat="server" Width="190px"></asp:TextBox>
        <br />
        <br />
        password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="password" runat="server" Width="176px" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        confirm password&nbsp;&nbsp;
        <asp:TextBox ID="confirmpassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" Font-Bold="True" Font-Size="Medium" />
            <p>
            <asp:Label id="Label1" runat="server" text="Label 1"></asp:Label>
        </p>
    </form>
</body>
</html>
