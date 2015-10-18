<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editbookappointment.aspx.cs" Inherits="editbookappointment" %>
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
        string editappointments;
        editappointments = "update [appointments] set [appointmentday] = '" + appointmentday.SelectedValue + "'";
        DBCommand.CommandType = CommandType.Text;
        DBCommand.CommandText = editappointments;
        DBCommand.Connection = DBConnection;
        DBConnection.Open();
        editappointments = Label7.Text;
        DBCommand.ExecuteNonQuery();
        DBConnection.Close();
        Response.Redirect("bookappointment.aspx");
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
    <asp:Label ID="Label1" runat="server" Text="Edit Book Appointment Information"></asp:Label>
        <br />
        <br />
    <asp:Label ID="Label2" runat="server">Appointment Day</asp:Label>
                    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="appointmentday" runat="server">
        <asp:ListItem Text="Monday" Value="Monday"></asp:ListItem>
        <asp:ListItem Text="Tuesday" Value="Tuesday"></asp:ListItem>
        <asp:ListItem Text="Wednesday" Value="Wednesday"></asp:ListItem>
        <asp:ListItem Text="Thursday" Value="Thursday"></asp:ListItem>
        <asp:ListItem Text="Friday" Value="Friday"></asp:ListItem>
        
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server">Appointment Date</asp:Label>
     
                    
        <br />
     
                    
        <br />
     
                    
        <asp:Calendar ID="appointmentdate" runat="server"></asp:Calendar>
        <br />
        Tutor Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:TextBox ID="tutorname" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server">Appointment Time</asp:Label>
      
     
                    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="appointmenttime" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" Font-Bold="True" Font-Size="Medium" />
    <asp:Label ID="Label7" runat="server" Visible="False"></asp:Label>
    
    
    </form>
    <br /><a href="index.aspx">Home Page</a>
    <br /><a href="courseinfo.aspx">Course Information</a>
    <br /><a href="tutorinfo.aspx">Tutor Information</a>
    <br /><a href="ecsinfo.aspx">ECs Information</a>
    <br /><a href="available.aspx">Available Page</a>
    <br /><a href="email.aspx">Email Page</a>
</body>
</html>
