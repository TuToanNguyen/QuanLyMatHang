using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyMatHang
{
    public partial class QL_mặt_hàng : Form
    {
        SqlCommand cm;
        SqlDataAdapter da;
        SqlDataReader dr;
        DataSet ds;
        DataTable dt;
        Connection cn = new Connection();

        public QL_mặt_hàng()
        {
            InitializeComponent();
        }

        //Hiển thị dữ liệu từ CSDL lên DataGridview
        private void hienthi_DataGridview()
        {
            Connection cn = new Connection();
            cn.OpenConn();
            string sql = "select DISTINCT MAMH as 'Mã MH',TENMH as 'Tên MH', SOLUONG as 'Số lượng', GIA as 'Giá', NSX.TENNSX as 'Nhà sản xuất' from MATHANG, NSX where MATHANG.MANSX = NSX.MANSX";
            SqlCommand cmd = new SqlCommand(sql, cn.con);
            dr = cmd.ExecuteReader();
            dt = new DataTable();
            dt.Load(dr);
            dataGridView1.DataSource = dt;
            cn.CloseConn();
        }

        //Load dữ liệu từ CSDL lên Combobox 
        public void Loadcombobox()
        {      
            cn.OpenConn();
            cm = new SqlCommand("select MANSX, TENNSX from NSX ", cn.con);
            da = new SqlDataAdapter(cm);
            ds = new DataSet();
            da.Fill(ds);
            cbNSX.DataSource = ds.Tables[0];
            cbNSX.DisplayMember = "TENNSX";
            cbNSX.ValueMember = "MANSX";
        }

        //Sự kiện CellClick, khi click vào DataGridview sẽ đỗ dữ liệu lên Texbox và Combobox
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];

                lbMa.Text = row.Cells[0].Value.ToString();
                txtten.Text = row.Cells[1].Value.ToString();
                txtSoluong.Text = row.Cells[2].Value.ToString();
                txtGia.Text = row.Cells[3].Value.ToString();
                cbNSX.Text = row.Cells[4].Value.ToString();

            }
        }

        //Sự kiện Load cửa form
        //Đưa các hàm cần Load lên khi mở form
        private void QL_mặt_hàng_Load(object sender, EventArgs e)
        {
            Loadcombobox();
            hienthi_DataGridview();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            cn.OpenConn();
            string tenmh = txtten.Text;
            string soluong = txtSoluong.Text;
            string gia = txtGia.Text;
            string nsx = cbNSX.SelectedValue.ToString();

            if (tenmh == "" || soluong == "" || gia == "")
            {
                MessageBox.Show("Thông tin loại không được bỏ trống!!!");
            }
            else
            {
                string sqlthem = "insert into MATHANG values(N'" + tenmh + "','" + soluong + "','" + gia + "','" + nsx + "')";
                cm = new SqlCommand(sqlthem, cn.con);
                try
                {
                    cm.ExecuteNonQuery();
                    cm.Dispose();
                    cn.CloseConn();
                    MessageBox.Show("Thêm thành công");
                }
                catch
                {
                    cm.Dispose();
                    cn.CloseConn();
                    MessageBox.Show("Thêm thất bại!");
                }
            }
            hienthi_DataGridview();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            cn.OpenConn();
            string ma = lbMa.Text;
            string tenmh = txtten.Text;
            string soluong = txtSoluong.Text;
            string gia = txtGia.Text;
            string nsx = cbNSX.SelectedValue.ToString();

            DialogResult dlr = MessageBox.Show("Bạn có chắc muốn sửa?", "THÔNG BÁO", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (DialogResult.OK == dlr)
            {
                string sqlsua = "update MATHANG set TENMH=N'" + tenmh + "',SOLUONG='" + soluong + "',GIA='" + gia + "',MANSX='" + nsx + "' where MAMH='" + ma + "'";
                cm = new SqlCommand(sqlsua, cn.con);
                try
                {
                    cm.ExecuteNonQuery();
                    cm.Dispose();
                    cn.CloseConn();
                    MessageBox.Show("Sửa thành công");
                }
                catch
                {
                    cm.Dispose();
                    cn.CloseConn();
                    MessageBox.Show("Sửa thất bại!");
                }
            }
            hienthi_DataGridview();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            cn.OpenConn();
            string ma = lbMa.Text;

            DialogResult dlr = MessageBox.Show("Bạn có chắc muốn xóa?", "THÔNG BÁO", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (DialogResult.OK == dlr)
            {
                string sqlxoa = "delete MATHANG where  MAMH='" + ma + "'";
                cm = new SqlCommand(sqlxoa, cn.con);
                try
                {
                    cm.ExecuteNonQuery();
                    cm.Dispose();
                    cn.CloseConn();
                    MessageBox.Show("Xóa thành công");

                    //Xóa dữ liệu trên form khi xóa thành công
                    lbMa.Text = "Mã mặt hàng";
                    txtten.Clear();
                    txtSoluong.Clear();
                    txtGia.Clear();
                }
                catch
                {
                    cm.Dispose();
                    cn.CloseConn();
                    MessageBox.Show("Xóa thất bại!");
                }
            }
            hienthi_DataGridview();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Form1 f = new Form1();
            this.Hide();
            f.Show();
        }
    }
}
