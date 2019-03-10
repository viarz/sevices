using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBProject.DAL;

namespace DBProject
{
	public partial class AddService : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void ServiceRegister(object sender, EventArgs e)
		{
			
				myDAL objmyDAL = new myDAL();

			

				if (objmyDAL.AddService(Name.Text, Phone.Text, Address.Text) == 1) ;
				{
					Response.BufferOutput = true;
					Msg.Visible = true;
					Msg.Text = Designation.Text + " Added Succesfully";
					flushInformation();
				}

			
		}
		protected void flushInformation()
		{
			Name.Text = "";
			Phone.Text = "";
			Address.Text = "";
		}

		
	}
}