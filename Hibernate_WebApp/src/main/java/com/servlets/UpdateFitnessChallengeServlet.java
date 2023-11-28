package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import com.helper.FactoryProvider;
import com.model.FitnessChallenge; // Ensure to import your FitnessChallenge entity class

@WebServlet("/updateFitnessChallengeServlet")
public class UpdateFitnessChallengeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve data from the form
        int fitnessChallengeId = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int numberOfParticipants = Integer.parseInt(request.getParameter("numberOfParticipants"));
        // For dates, you'll need to parse them appropriately from the request and handle them as Date objects

        Session session = FactoryProvider.getFactory().openSession();

        try {
            // Begin a transaction
            session.beginTransaction();

            // Retrieve the Fitness Challenge with the given ID from the database
            FitnessChallenge fitnessChallenge = session.get(FitnessChallenge.class, fitnessChallengeId);

            // Update the Fitness Challenge's information
            if (fitnessChallenge != null) {
                fitnessChallenge.setTitle(title);
                fitnessChallenge.setDescription(description);
                fitnessChallenge.setDuration(duration);
                fitnessChallenge.setNumberOfParticipants(numberOfParticipants);
                // Update other attributes accordingly

                // Save the updated Fitness Challenge to the database
                session.merge(fitnessChallenge);
            } else {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<h1 style='text-align:center;'>Fitness Challenge Not Found</h1>");
                out.println("<h1 style='text-align:center;'><a href='listFitnessChallenges.jsp'>View all Fitness Challenges</a></h1>");
            }

            // Commit the transaction
            session.getTransaction().commit();
        } finally {
            session.close();
        }

        // Redirect to a success page or a list of Fitness Challenges
        response.sendRedirect("listFitnessChallenges.jsp");
    }
}
