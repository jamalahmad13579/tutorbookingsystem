<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edittutorinfo.aspx.cs" Inherits="edittutorinfo" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["loggedin"] == null)
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
        string edittutors;
        edittutors = "update [tutors] set [firstname] = '" + firstname.Text + "'";
        DBCommand.CommandType = CommandType.Text;
        DBCommand.CommandText = edittutors;
        DBCommand.Connection = DBConnection;
        DBConnection.Open();
        edittutors = Label7.Text;
        DBCommand.ExecuteNonQuery();
        DBConnection.Close();
        Response.Redirect("tutorinfo.aspx");
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
    <asp:Label ID="Label1" runat="server" Text="Edit Tutor Information"></asp:Label>
        <br />
        <br />
    <asp:Label ID="Label2" runat="server">Firstname</asp:Label>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server">Surname</asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="surname" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server">Telephone No</asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="telephoneno" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server">Email Address</asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="emailaddress" runat="server"></asp:TextBox>
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;<br />
        <asp:Calendar ID="availability" runat="server"></asp:Calendar>
        <br />
        <asp:Label ID="Label6" runat="server">Start Time</asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:TextBox ID="starttime" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label8" runat="server">End Time</asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:TextBox ID="endtime" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" Font-Bold="True" Font-Size="Medium" />
    <asp:Label ID="Label7" runat="server" Visible="False"></asp:Label>
    </form>
    <br /><a href="index.aspx">Home Page</a>
       <br /><a href="bookappointment.aspx">Book Appointment</a>
       <br /><a href="courseinfo.aspx">Course Information</a>
       <br /><a href="moduleinfo.aspx">Module Information</a>
    <br /><a href="ecsinfo.aspx">ECs Information</a>
    <br /><a href="available.aspx">Available Page</a>
    <br /><a href="email.aspx">Email Page</a>
</body>
</html>
