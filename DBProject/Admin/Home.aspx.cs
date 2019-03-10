using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DBProject.DAL;

namespace DBProject
{
	public partial class Home : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{
            GetServiceHomeInformation();
		}



		public void GetServiceHomeInformation()
		{
			myDAL objmyDAL = new myDAL();

			DataTable table = new DataTable();
            /*for (int i = 0; i < 5; i++)
			{
				arrTable[i] = new DataTable();
			}*/
           // arrTable[0] = new DataTable();

            objmyDAL.GetServiceHomeInformation(ref table);

	


			service_View.DataSource = table;
			service_View.DataBind();


		
			







		}

	}

}