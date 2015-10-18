<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
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
        strconnect = "Provider=microsoft.jet.oledb.4.0;";
        strconnect += "data source=" + MapPath(".\\tutorbookingsystem.mdb");
        strconnect += ";persist security info=false";
        System.Data.OleDb.OleDbConnection
        DBConnection = new System.Data.OleDb.OleDbConnection(strconnect);
        System.Data.OleDb.OleDbCommand
        DBCommand = new OleDbCommand();
        string queryusers;
        int countusers;
        string username;
        string password;
        username = TextBox1.Text;
        password = TextBox2.Text;
        queryusers = "select count (*) from users where username='" + username + "' and password='" + password + "';";
        DBCommand.CommandType = CommandType.Text;
        DBCommand.CommandText = queryusers;
        DBCommand.Connection = DBConnection;
        DBConnection.Open();
        countusers = (int)DBCommand.ExecuteScalar();
        DBConnection.Close();
        if (countusers < 1)
        {
            Label4.Text = "login failed";
        }
        else
        {
            Session ["loggedin"] = TextBox1.Text;
            Response.Redirect("bookappointment.aspx");
        }
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
    <form id="form1" runat="server" visible="True">
    
        Please Enter Login Details :<br />
        <br />
        Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" Font-Bold="True" Font-Size="Medium" />
        <br /><asp:Label ID="Label4" runat="server"></asp:Label>

     <br />
        </form>
        <a href="index.aspx">Home Page</a>
        <br /><a href="newusers.aspx">Create New Account</a>
</body>
</html>
