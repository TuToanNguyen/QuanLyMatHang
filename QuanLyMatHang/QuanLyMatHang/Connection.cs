using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyMatHang
{
    class Connection
    {
        string strConn = "server=NICOLAIPC; database=QLMH; uid=sa; pwd=system";
        public SqlConnection con { get; set; }
        public SqlDataReader drd { get; set; }
        public SqlCommand cmd { get; set; }

        public Connection()
        {
            con = new SqlConnection(strConn);
            drd = null;
            cmd = null;
        }
        public bool OpenConn()
        {
            try
            {
                this.con.Open();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        public bool CloseConn()
        {
            try
            {
                this.drd.Close();
                this.con.Close();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
    }
}

