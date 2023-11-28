<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.vignan.FitnessChallenge" %>
<%@ page import="com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Fitness Challenges</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .container {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>List of Fitness Challenges</h1>
    
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

    <div class="container">
        <a href="index.jsp" class="btn">Home</a>
    </div>
</body>
</html>
