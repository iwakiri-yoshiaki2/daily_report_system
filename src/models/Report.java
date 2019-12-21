package models;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "reports")
@NamedQueries({
    @NamedQuery(
            name = "getAllReports",
            query = "SELECT r FROM Report AS r ORDER BY r.id DESC"
            ),
    @NamedQuery(
            name = "getReportsCount",
            query = "SELECT COUNT(r) FROM Report AS r"
            ),
    @NamedQuery(
            name = "getMyAllReports",
            query = "SELECT r FROM Report AS r WHERE r.employee = :employee ORDER BY r.id DESC"
            ),
    @NamedQuery(
            name = "getMyReportsCount",
            query = "SELECT COUNT(r) FROM Report AS r WHERE r.employee = :employee"
            ),
    @NamedQuery(
            name = "getMyDailyReportsCount",
            query = "SELECT COUNT(r) FROM Report AS r WHERE r.report_date = :report_date"
            )
})

@Entity
public class Report {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "employee_id", nullable = false)
    private Employee employee;

    @Column(name = "report_date", nullable = false)
    private Date report_date;

    @Column(name = "title", length = 255, nullable = false)
    private String title;

    @Lob
    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    //出勤時間、退勤時間の項目追加（12/15）int型にする！
    @Column(name = "attendance_time_hour", nullable = false)
    private Integer attendance_time_hour;

    @Column(name = "attendance_time_minute", nullable = false)
    private Integer attendance_time_minute;

    @Column(name = "clocking_out_time_hour", nullable = false)
    private Integer clocking_out_time_hour;

    @Column(name = "clocking_out_time_minute", nullable = false)
    private Integer clocking_out_time_minute;



    public Integer getAttendance_time_hour() {
        return attendance_time_hour;
    }

    public void setAttendance_time_hour(Integer attendance_time_hour) {
        this.attendance_time_hour = attendance_time_hour;
    }

    public Integer getAttendance_time_minute() {
        return attendance_time_minute;
    }

    public void setAttendance_time_minute(Integer attendance_time_minute) {
        this.attendance_time_minute = attendance_time_minute;
    }

    public Integer getClocking_out_time_hour() {
        return clocking_out_time_hour;
    }

    public void setClocking_out_time_hour(Integer clocking_out_time_hour) {
        this.clocking_out_time_hour = clocking_out_time_hour;
    }

    public Integer getClocking_out_time_minute() {
        return clocking_out_time_minute;
    }

    public void setClocking_out_time_minute(Integer clocking_out_time_minute) {
        this.clocking_out_time_minute = clocking_out_time_minute;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Date getReport_date() {
        return report_date;
    }

    public void setReport_date(Date report_date) {
        this.report_date = report_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }



}
