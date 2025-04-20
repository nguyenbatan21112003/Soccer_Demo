/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import DBconnection.DBUtils;
import dto.BookDTO;
import dto.FieldDTO;
import dto.RevenuaDTO;
import dto.ReviewDTO;
import dto.TimeSlotDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.catalina.User;

/**
 *
 * @author bacda
 */
public class DAO {

    public List<FieldDTO> getAllField() {
        List<FieldDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM FOOTBALL_FIELD order by fieldID asc";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                FieldDTO field = new FieldDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7)
                );

                list.add(field);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Hiển thị lỗi để dễ debug
        }

        return list;
    }
    public List<UserDTO> getListUser() {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM Users";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                UserDTO field = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7)
                );

                list.add(field);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Hiển thị lỗi để dễ debug
        }

        return list;
    }

    public UserDTO getUserDetail(String username) {

        String sql = "SELECT * FROM USERS where Username = ? ";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO user = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                return user;
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Hiển thị lỗi để dễ debug
        }

        return null;
    }

    public List<FieldDTO> search(String keyword) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<FieldDTO> list = new ArrayList<>();
        String sql = "SELECT FieldID, FieldName, Price, ImageURL, Location FROM FOOTBALL_FIELD WHERE Location LIKE ? ";

        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                FieldDTO dto = new FieldDTO();
                dto.setFieldID(rs.getString(1));
                dto.setFieldName(rs.getString(2));
                dto.setPrice(rs.getDouble(3));
                dto.setImageURL(rs.getString(4));
                dto.setLocation(rs.getString(5));

                list.add(dto);
            }

        } catch (Exception e) {

        }

        return list;
    }

    public FieldDTO getDetail(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "select * from FOOTBALL_FIELD where FieldID = ?";

        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new FieldDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public UserDTO login(String username, String password) {

        UserDTO user = null;
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT UserID,FullName,Username, Role FROM USERS ";
            sql += " WHERE Username = ?  AND PasswordHash = ?";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                if (rs.next()) {

                    user = new UserDTO();
                    user.setUserName(rs.getString("Username"));
                    user.setUserId(rs.getString("UserID"));
                    user.setRole(rs.getString("Role"));
                    user.setFullName(rs.getString("FullName"));
                }
            }
            con.close();
        } catch (Exception e) {

        }
        return user;
    }

    public Boolean signup(int userId, String userName, String fullName, String email, String password, String address) {
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "INSERT INTO USERS VALUES(?,?,?,?,?,?,?) ";

        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, userName);
            ps.setString(7, fullName);

            ps.setString(3, "Customer");
            ps.setString(4, email);
            ps.setString(5, password);
            ps.setString(6, address);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
        }
        return false;
    }

    public int getMaxId() {
        int maxId = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT MAX(UserID) FROM USERS";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return maxId;
    }

    public static boolean create(int id, String name, String des, String loc, String price, String url, String amem) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "INSERT INTO FOOTBALL_FIELD (FieldID, FieldName, Description, Location, Price,ImageURL, Amenities) \n"
                    + "VALUES  (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, des);
            ps.setString(4, loc);
            ps.setString(5, price);
            ps.setString(6, url);
            ps.setString(7, amem);
            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
        }
        return true;
    }

    public static boolean delete(String id) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "delete from FOOTBALL_FIELD where FieldID = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }
    public static boolean deleteUser(String id) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "delete from Users where UserID = ? ";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public  void update(String id, String name, String des, String location, String price, String img, String amen) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "UPDATE FOOTBALL_FIELD\n"
                    + "                SET [FieldName] = ? ,[Description] = ? , [Location] = ? , [Price] = ? , [ImageURL] = ? ,[Amenities] = ? \n"
                    + "                WHERE [FieldID] = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, des);
            ps.setString(3, location);
            ps.setString(4, price);
            ps.setString(5, img);
            ps.setString(6, amen);
            ps.setString(7, id);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
        }
        
    }

    public static boolean changepass(String password, String userName) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "UPDATE Users SET password = ? WHERE Username = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(1, userName);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public List<TimeSlotDTO> listTime(String userID, String fieldID, String date) {
        List<TimeSlotDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT TS.SlotID, TS.Time\n"
                    + "FROM TIME_SLOT TS\n"
                    + "WHERE TS.SlotID NOT IN (\n"
                    + "    select SlotID from BOOKING where [FieldID]=? and [DateBooking] = ? and BookingStatus != 'Rejected')";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, fieldID);
            ps.setString(2, date);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TimeSlotDTO ts = new TimeSlotDTO();
                ts.setSlotID(rs.getString(1));
                ts.setTime(rs.getString(2));
                list.add(ts);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public boolean book(int id, String user, String field, String slot, String date) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "insert into booking (BookingID,UserID,FieldID,SlotID,DateBooking)values (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, user);
            ps.setString(3, field);
            ps.setString(4, slot);
            ps.setString(5, date);
            ps.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
        }

        return false;
    }

    public int getMaxSlotId() {
        int maxId = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT MAX(BookingID) FROM BOOKING";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return maxId;
    }

    public BookDTO getBookingDetail(String id1, String id2, String id3, int id4) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "select users.fullname , FOOTBALL_FIELD.FieldName , FOOTBALL_FIELD.Location , FOOTBALL_FIELD.Price, time_slot.time , booking.bookingstatus ,booking.datebooking  from booking , users , FOOTBALL_FIELD , time_slot\n"
                    + "  where booking.userid = users.UserID and \n"
                    + "  FOOTBALL_FIELD.FieldID=booking.FieldID and time_slot.slotid = booking.slotid and\n"
                    + "    BookingID = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id4);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BookDTO book = new BookDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7));
                return book;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public BookDTO getBookingDetails(String id4) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "select users.fullname , FOOTBALL_FIELD.FieldName , FOOTBALL_FIELD.Location , FOOTBALL_FIELD.Price, time_slot.time , booking.bookingstatus ,booking.datebooking  from booking , users , FOOTBALL_FIELD , time_slot\n"
                    + "  where booking.userid = users.UserID and \n"
                    + "  FOOTBALL_FIELD.FieldID=booking.FieldID and time_slot.slotid = booking.slotid and\n"
                    + "    BookingID = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, id4);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BookDTO book = new BookDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7));
                return book;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<BookDTO> getAllBooking() {
        List<BookDTO> list = new ArrayList<BookDTO>();
        String sql = "select users.fullname , FOOTBALL_FIELD.FieldName , FOOTBALL_FIELD.Location , FOOTBALL_FIELD.Price, time_slot.time , booking.bookingstatus ,booking.datebooking, booking.BookingID from booking , users , FOOTBALL_FIELD , time_slot\n"
                + "  where booking.userid = users.UserID and \n"
                + "  FOOTBALL_FIELD.FieldID=booking.FieldID and time_slot.slotid = booking.slotid";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDTO book = new BookDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                list.add(book);
            }

        } catch (Exception e) {
        }

        return list;
    }

    public List<BookDTO> getAllUserBooking(String id) {
        List<BookDTO> list = new ArrayList<BookDTO>();
        String sql = "select users.fullname , FOOTBALL_FIELD.FieldName , FOOTBALL_FIELD.Location , FOOTBALL_FIELD.Price, time_slot.time , booking.bookingstatus ,booking.datebooking, booking.BookingID from booking , users , FOOTBALL_FIELD , time_slot\n"
                + "  where booking.userid = users.UserID and \n"
                + "  FOOTBALL_FIELD.FieldID=booking.FieldID and time_slot.slotid = booking.slotid and users.userID = ?";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDTO book = new BookDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                list.add(book);
            }

        } catch (Exception e) {
        }

        return list;
    }

    public boolean confirm(String id) {
        String sql = "UPDATE BOOKING SET BookingStatus = 'Confirmed' WHERE bookingid = ?";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
        return true;
    }

    public boolean reject(String id) {
        String sql = "UPDATE BOOKING SET BookingStatus = 'Rejected' WHERE bookingid = ?";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
        return true;
    }

    public List<FieldDTO> getFieldsByPage(int page, int pageSize, String location) {
        List<FieldDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM FOOTBALL_FIELD where location like ? or fieldname like ? ORDER BY FieldID OFFSET ? ROWS FETCH NEXT ?  ROWS ONLY";
        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + location + "%");
            ps.setString(2, "%" + location + "%");
            ps.setInt(3, (page - 1) * pageSize);
            ps.setInt(4, pageSize);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                FieldDTO field = new FieldDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                list.add(field);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public int getTotalFields(String location) {
        int total = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM FOOTBALL_FIELD where location like ? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + location + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    public int getMaxReviewId() {
        int maxId = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT MAX(reviewID) FROM review";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return maxId;
    }
    public int getMaxFieldId() {
        int maxId = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT MAX(FieldID) FROM FOOTBALL_FIELD";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return maxId;
    }

    public boolean createReview(int id1, String id2, String id3, int id4) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "insert into review (reviewID , userid , fieldid ,bookingid)values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id1);
            ps.setString(2, id2);
            ps.setString(3, id3);
            ps.setInt(4, id4);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public boolean reviewing(String rate, String content, String id) {
        try {
            Connection con = DBUtils.getConnection();
            String sql = "update review set timecmt = GETDATE() , rating = ?  , content = ? , status='Reviewed'  where bookingid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, rate);
            ps.setString(2, content);
            ps.setString(3, id);
            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
        }
        return true;
    }

    public List<ReviewDTO> getAllReview(String id) {
        List<ReviewDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "select users.fullname , rating , content , timecmt from REVIEW , USERS where REVIEW.UserID = USERs.UserID and fieldid = ? and REVIEW.Status = 'Reviewed'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ReviewDTO review = new ReviewDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)
                );
                list.add(review);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<RevenuaDTO> revenua() {
        List<RevenuaDTO> list = new ArrayList<>();
        String sql = "  SELECT \n"
                + "    b.DateBooking AS BookingDate,\n"
                + "    SUM(f.Price) AS TotalRevenue\n"
                + "FROM dbo.BOOKING b\n"
                + "JOIN dbo.FOOTBALL_FIELD f ON b.FieldID = f.FieldID\n"
                + "WHERE b.BookingStatus = 'Confirmed'\n"
                + "GROUP BY b.DateBooking\n"
                + "ORDER BY b.DateBooking;";

        try (Connection con = DBUtils.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RevenuaDTO revenua = new RevenuaDTO(rs.getString(1), rs.getDouble(2));
                list.add(revenua);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
