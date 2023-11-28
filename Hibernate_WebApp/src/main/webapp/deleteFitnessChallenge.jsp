<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.vignan.FitnessChallenge"%>
<%@ page import="com.helper.FactoryProvider"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Fitness Challenge</title>
    <style>
        /* Add your CSS styles here */
        /* ... Your existing styles ... */
    </style>
</head>
<body>
    <h1>Delete Fitness Challenge</h1>

    <h2>List of Fitness Challenges</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
        </tr>

        <%
        Session session = FactoryProvider.getFactory().openSession();
        try {
            session.beginTransaction();
            List<FitnessChallenge> fitnessChallenges = session.createQuery("from fitness_challenges").getResultList();
            
            for (FitnessChallenge challenge : fitnessChallenges) {
        %>
        <tr>
            <td><%= challenge.getId() %></td>
            <td><%= challenge.getTitle() %></td>
            <td><%= challenge.getDescription() %></td>
        </tr>
        <%
            }
            session.getTransaction().commit();
        } finally {
            session.close();
        }
        %>
    </table>

    <h2>Delete Fitness Challenge</h2>
    <form action="deleteFitnessChallengeServlet" method="post">
        <label for="id">Fitness Challenge ID:</label>
        <input type="text" name="id" required>
        <input type="submit" value="Delete Fitness Challenge">
    </form>
</body>
</html>
