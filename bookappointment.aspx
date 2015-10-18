<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookappointment.aspx.cs" Inherits="bookappointment" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
             if (Session["loggedin"]==null)
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
        Session.Remove("loggedin");
        Response.Redirect("login.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string strconnect;
        int? ca = 0;
        strconnect = "Provider=microsoft.jet.oledb.4.0;";
        strconnect += "data source=" + MapPath(".\\tutorbookingsystem.mdb");
        strconnect += ";persist security info=false";
        System.Data.OleDb.OleDbConnection
        DBConnection = new System.Data.OleDb.OleDbConnection(strconnect);
        System.Data.OleDb.OleDbCommand 
        DBCommand = new OleDbCommand();
        DBCommand.CommandType = CommandType.Text;
        String date = appointmentdate.SelectedDate.ToString();
        String time = appointmenttime.Text;
        DateTime apptime = DateTime.Parse(appointmenttime.Text);
        //DBCommand.CommandText = "SELECT count (*) from appointments Where appointmentdate='" + date + "' And appointmenttime='" +time+ "'";
        DBCommand.CommandText = "SELECT count (*) from availability where username ='" + tutorname.Text + "' And availabledate = '" + appointmentdate.SelectedDate.ToString() + "' And #" + apptime.TimeOfDay + "# between starttime And endtime";
        Label5.Text = DBCommand.CommandText;
        DBCommand.Connection = DBConnection;
        DBConnection.Open();
        ca = (int?)DBCommand.ExecuteScalar();
        if (ca >=1)
        {
            DBCommand.CommandText = "INSERT INTO [appointments] ([appointmentday], [appointmentdate], [appointmenttime],[tutorname]) VALUES ('" + appointmentday.SelectedValue + "','" + appointmentdate.SelectedDate + "','" + appointmenttime.Text + "','"+tutorname.Text+"')";
            DBCommand.Connection = DBConnection;
            DBCommand.ExecuteNonQuery(); //for INSERT, DELETE, UPDATE, CREATE,..
        }
        else
        {
            Response.Write("The tutor is unavailable");   
        }
            
            DBConnection.Close();   
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
    <strong><h1>Booking Appointments</h1></strong>
    <strong><h2>This is a tutor booking system</h2></strong>
     <asp:Label ID="Label1" runat="server">Appointment Day</asp:Label>
                    
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
        <asp:Label ID="Label2" runat="server">Appointment Date</asp:Label>
     
                    
        <br />
     
                    
        <br />
     
                    
        <asp:Calendar ID="appointmentdate" runat="server"></asp:Calendar>
        <asp:Label ID="Label4" runat="server" Text="Tutor Name"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tutorname" runat="server" ></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server">Appointment Time</asp:Label>
      
     
                    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="appointmenttime" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="submit" OnClick="Button2_Click" Font-Bold="True" Font-Size="Medium" />
        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="logout" OnClick="Button1_Click" Font-Bold="True" Font-Size="Medium" />
      
    </form>
    <br /><a href="editbookappointment.aspx">Edit Book Appointment</a>
    <br /><a href="index.aspx">Home Page</a>
    <br /><a href="editdata.aspx">Edit Data</a>
    <br /><a href="courseinfo.aspx">Course Information</a>
    <br /><a href="tutorinfo.aspx">Tutor Information</a>
    <br /><a href="ecsinfo.aspx">ECs Information</a>
    <br /><a href="moduleinfo.aspx">Module Information</a>
    <br /><a href="available.aspx">Available Page</a>
    <br /><a href="email.aspx">Email Page</a>
</body>
</html>
