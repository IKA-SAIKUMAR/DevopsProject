<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BMI Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .result {
            margin-top: 20px;
            font-size: 1.2em;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>BMI Calculator</h1>
        <label for="height">Height (in meters):</label>
        <input type="number" id="height" step="0.01" placeholder="Enter height in meters">
        
        <label for="weight">Weight (in kilograms):</label>
        <input type="number" id="weight" step="0.1" placeholder="Enter weight in kilograms">
        
        <button onclick="calculateBMI()">Calculate BMI</button>
        
        <div class="result" id="result"></div>
    </div>

    <script>
        function calculateBMI() {
            var height = document.getElementById('height').value;
            var weight = document.getElementById('weight').value;

            if (height > 0 && weight > 0) {
                var bmi = weight / (height * height);
                bmi = bmi.toFixed(2);  // Round to two decimal places
                document.getElementById('result').innerHTML = "Your BMI is " + bmi;
            } else {
                document.getElementById('result').innerHTML = "Please enter valid height and weight.";
            }
        }
    </script>
</body>
</html>
