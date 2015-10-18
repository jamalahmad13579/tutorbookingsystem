<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editdata.aspx.cs" Inherits="editdata" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session ["loggedin"]==null)
            {
                Session.Remove("loggedin");
                Response.Redirect("login.aspx");    

            }
                    
            }
        catch (InvalidCastException)
        {
            Response.Redirect("login.aspx");
        }

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
        string un;
        un = (string)Session["loggedin"];
        string editusers;
        editusers = "update [users] set [username] = '" + username.Text + "'";
        DBCommand.CommandType = CommandType.Text;
        DBCommand.CommandText = editusers;
        DBCommand.Connection = DBConnection;
        DBConnection.Open();
        editusers = Label7.Text;
        DBCommand.ExecuteNonQuery();
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
    <asp:Label ID="Label1" runat="server" Text="Editing Data For"></asp:Label>
    
        <br />
        <br />
    
    <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="username" runat="server"></asp:TextBox>
    <br />
        <br />
    <asp:Label ID="Label3" runat="server" Text="Firstname"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
        <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Surname"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="surname" runat="server"></asp:TextBox>
    <br />
        <br />
    <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
    <br />
        <br />
    <asp:Label ID="Label6" runat="server" Text="Confirm Password"></asp:Label>
    &nbsp;&nbsp;
    <asp:TextBox ID="confirmpassword" runat="server" TextMode="Password"></asp:TextBox>
    <br />
        <br />
    <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" Font-Bold="True" Font-Size="Medium" />
    <asp:Label ID="Label7" runat="server" Visible="False"></asp:Label>
    <p>
        &nbsp;</p>
 
    </form>
     <br /><a href="index.aspx">Home Page</a>
     <br /><a href="courseinfo.aspx">Course Information</a>
    <br /><a href="tutorinfo.aspx">Tutor Information</a>
    <br /><a href="ecsinfo.aspx">ECs Information</a>
    <br /><a href="moduleinfo.aspx">Module Information</a>
    <br /><a href="email.aspx">Email Page</a>
   
</body>
</html>
