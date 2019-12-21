package checkings;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.Report;
import utils.DBUtil;

public class CheckMultipleReports {
    public static List<String> checkMutiReports (Report r){
        List<String> errors = new ArrayList<String>();
        String report_date_errors = _checkReport_date(r);
        if (!report_date_errors.equals("")){
            errors.add(report_date_errors);

        }
        return errors;
    }

    public static String _checkReport_date(Report r){
        EntityManager em = DBUtil.createEntityManager();
        long report_daily_count = em.createNamedQuery("getMyDailyReportsCount", Long.class)
                .setParameter("report_date", r.getReport_date())
                .setParameter("id", r.getEmployee())
                .getSingleResult();
        System.out.println("カウント" + report_daily_count);
        System.out.println(r.getReport_date());
        System.out.println(r.getEmployee());

        if (report_daily_count >= 1){
            return "本日の日報はすでに登録されています。";
        }
        return "";
    }

}
