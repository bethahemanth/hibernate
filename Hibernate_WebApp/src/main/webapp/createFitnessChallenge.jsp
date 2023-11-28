<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Fitness Challenge</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Create Fitness Challenge</h1>
    
    <form action="createFitnessChallenge.jsp" method="post">
        <label for="title">Title:</label>
        <input type="text" name="title" required>
        
        <label for="description">Description:</label>
        <input type="text" name="description" required>
        
        <label for="duration">Duration (in days):</label>
        <input type="number" name="duration" required>
        
        <label for="numberOfParticipants">Number of Participants:</label>
        <input type="number" name="numberOfParticipants" required>
        
        <label for="startDate">Start Date:</label>
        <input type="date" name="startDate" required>
        
        <label for="endDate">End Date:</label>
        <input type="date" name="endDate" required>
        
        <input type="submit" value="Create Fitness Challenge">
    </form>
</body>
</html>
