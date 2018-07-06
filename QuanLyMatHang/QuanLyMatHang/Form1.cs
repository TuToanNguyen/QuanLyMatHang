using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyMatHang
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void qLMặtHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            QL_mặt_hàng f = new QL_mặt_hàng();
            f.Show();
            this.Hide();
        }

        private void thoátToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DialogResult dlr = MessageBox.Show("Bạn có chắc muốn ngừng làm việc với hệ thống?", "THÔNG BÁO", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (dlr == DialogResult.OK)
            {
                Environment.Exit(0);
            }
            else if (dlr == DialogResult.Cancel)
            {
                ((FormClosingEventArgs)e).Cancel = true;
            }
        }
    }
}
