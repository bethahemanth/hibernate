package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.model.FitnessChallenge;

@WebServlet("/createFitnessChallengeServlet")
public class CreateFitnessChallengeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CreateFitnessChallengeServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int numberOfParticipants = Integer.parseInt(request.getParameter("numberOfParticipants"));
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        try {
            startDate = formatter.parse(startDateStr);
            endDate = formatter.parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        FitnessChallenge fitnessChallenge = new FitnessChallenge();
        fitnessChallenge.setTitle(title);
        fitnessChallenge.setDescription(description);
        fitnessChallenge.setDuration(duration);
        fitnessChallenge.setNumberOfParticipants(numberOfParticipants);
        fitnessChallenge.setStartDate(startDate);
        fitnessChallenge.setEndDate(endDate);

        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.persist(fitnessChallenge);
        tx.commit();
        session.close();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h1 style='text-align:center;'>Fitness Challenge added successfully</h1>");
        out.println("<h1 style='text-align:center;'><a href='listFitnessChallenges.jsp'>View all Fitness Challenges</a></h1>");
    }
}
