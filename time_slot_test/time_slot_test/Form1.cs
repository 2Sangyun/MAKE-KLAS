using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace time_slot_test
{
    public partial class Form1 : Form
    {
        private MySqlConnection conn =
            new MySqlConnection("Server=localhost;Database=klas;Uid=root;Pwd=alstn2512!;");
        private MySqlCommand cmd = new MySqlCommand();

        private List<List<string>> times = new List<List<string>>();
        private int rows = 8;
        private string ID;
        private bool is_login = false;

        public Form1()
        {
            InitializeComponent();
        }

        // 로그인 버튼
        private void btnLogin_Click(object sender, EventArgs e)
        {
            conn.Open();
            cmd.CommandText= "SELECT password FROM klas.password Where ID=" + txtID.Text + ";";
            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                if (reader["password"].ToString().Equals(txtPW.Text))
                {
                    MessageBox.Show("로그인 성공");
                    ID = txtID.Text;
                    is_login = true;
                }
                else
                    MessageBox.Show("로그인 실패");
            }

            conn.Close();

            if (is_login)
                load_table();
        }

        // 시간표 초기설정
        private void Form1_Load(object sender, EventArgs e)
        {
            cmd.Connection = conn;

            for (int i = 0; i < rows; ++i)
            {
                times.Add(new List<string>());
                for (int j = 0; j < 7; ++j)
                    times[i].Add("");
                times[i][0] = i.ToString();
                time_table.Rows.Add();
            }
            times[7][0] = "99";

            update_table();
        }

        // 시간표 불러오기
        private void load_table()
        {
            List<string> course_id = new List<string>();
            string msg = "";

            conn.Open();
            cmd.CommandText = "SELECT title, time_slot_1, time_slot_2, time_slot_3 " +
                            "FROM klas.course natural join klas.section " +
                            "where course_id in (SELECT course_id " +
                                                "FROM klas.takes " +
                                                "where ID = " + ID + "); ";
            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                for(int i = 1; i <= 3; ++i)
                {
                    string attribute = "time_slot_" + i.ToString();
                    string time_slot = reader[attribute].ToString();
                    if (time_slot.Length > 0)
                    {
                        int day = day_num(time_slot.Substring(0, 1));
                        int time = Convert.ToInt32(time_slot.Substring(1));

                        if (time < 7)
                        {
                            times[time][day] = reader["title"].ToString();
                        }
                        else if (time == 99)
                        {
                            times[7][day] = reader["title"].ToString();
                        }
                    }
                }

                update_table();
            }

            conn.Close();
        }

        // 시간표 업데이트
        private void update_table()
        {
            for(int i = 0; i < rows; ++i)
            {
                time_table.Rows[i].SetValues(times[i][0],
                    times[i][1],
                    times[i][2],
                    times[i][3],
                    times[i][4],
                    times[i][5],
                    times[i][6]);
            }
        }

        // 요일을 숫자로 변환
        private int day_num(string day)
        {
            switch (day)
            {
                case "월":
                    return 1;
                case "화":
                    return 2;
                case "수":
                    return 3;
                case "목":
                    return 4;
                case "금":
                    return 5;
                case "토":
                    return 6;
                default:
                    return 0;
            }
        }
    }
}
