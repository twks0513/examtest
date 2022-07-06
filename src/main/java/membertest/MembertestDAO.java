package membertest;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import DBPKG.DBConnect;
import money.MoneyDTO;

public class MembertestDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
		public MembertestDAO() {
			try {
				con = DBConnect.getConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public ArrayList<MembertestDTO> getMembers() {
			ArrayList<MembertestDTO> list = new ArrayList<MembertestDTO>();
			String sql = "select * from member_tbl_02";
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					MembertestDTO dto = new MembertestDTO();
					dto.setCustno(rs.getInt("custno"));
					dto.setCustname(rs.getString("custname"));
					dto.setPhone(rs.getString("phone"));
					dto.setAddress(rs.getString("address"));					
					dto.setJoindate(rs.getDate("joindate"));
					dto.setGrade(rs.getString("grade"));
					dto.setCity(rs.getString("city"));
					list.add(dto);					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}			
			return list;			
		}
		
		public int lastnum() {
			String sql = "select max(custno) from member_tbl_02";
			int num = 0;
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					num = rs.getInt("max(custno)");
					System.out.println(num);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return num+1;
		}
		
		
		public int register(String custname, String phone,String address, String joindate,String grade,String city) {
			String sql = "insert into member_tbl_02 values(member_tbl_02_seq.nextval,?,?,?,?,?,?)";
			int r = 0;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, custname);
				ps.setString(2, phone);
				ps.setString(3, address);				
				ps.setString(4, joindate);
				ps.setString(5, grade);
				ps.setString(6, city);				
				r = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}			
			return r;
		}
		
		public ArrayList<MembertestDTO> sell() {
			ArrayList<MembertestDTO> list = new ArrayList<MembertestDTO>();
			String sql="select mem.custno,mem.custname,mem.grade,sum(mon.price) "
					+ "from member_tbl_02 mem inner join money_tbl_02 mon "
					+ "on mem.custno = mon.custno group by mem.custno,mem.custname,mem.grade order by sum(price) desc";
			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					MembertestDTO dto = new MembertestDTO();
					MoneyDTO mdto = new MoneyDTO();
					dto.setCustno(rs.getInt("custno"));
					dto.setCustname(rs.getString("custname"));
					dto.setGrade(rs.getString("grade"));
					dto.setPrice(rs.getInt("sum(mon.price)"));
					if(dto.getPrice()!=0) {
						list.add(dto);	
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public int modify(String custname,String phone,String address,String joindate, String grade, String city ) {
			String sql = "update member_tbl_02 set custname=?,phone=?,address=?,joindate=?,grade?,city=?";
			int m = 0;
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, custname);
				ps.setString(2, phone);
				ps.setString(3, address);
				ps.setString(4, joindate);
				ps.setString(5, grade);
				ps.setString(6, city);
				m = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();			
			}
			System.out.println(m);
			return m;
		}
		
}
