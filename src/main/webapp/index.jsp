<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BMI Calculator</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e0f7fa; /* Light teal background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        h1 {
            color: #00796b;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #004d40;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #00796b;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #00796b;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #004d40;
        }
        .result {
            margin-top: 20px;
            font-size: 1.4em;
            color: #004d40;
        }
        .status {
            margin-top: 10px;
            font-size: 1.2em;
            color: #00796b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>BMI Calculator</h1>
        
        <label for="feet">Height (Feet):</label>
        <input type="number" id="feet" placeholder="Enter feet" min="0">

        <label for="inches">Height (Inches):</label>
        <input type="number" id="inches" placeholder="Enter inches" min="0" max="11">

        <label for="weight">Weight (in kilograms):</label>
        <input type="number" id="weight" step="0.1" placeholder="Enter weight in kilograms">
        
        <button onclick="calculateBMI()">Calculate BMI</button>
        
        <div class="result" id="result"></div>
        <div class="status" id="status"></div>
    </div>

    <script>
        function calculateBMI() {
            var feet = document.getElementById('feet').value;
            var inches = document.getElementById('inches').value;
            var weight = document.getElementById('weight').value;

            // Convert height to meters
            var totalInches = (parseFloat(feet) * 12) + parseFloat(inches);
            var heightInMeters = totalInches * 0.0254;

            if (heightInMeters > 0 && weight > 0) {
                var bmi = weight / (heightInMeters * heightInMeters);
                bmi = bmi.toFixed(2);  // Round to two decimal places
                
                // Display the BMI result
                document.getElementById('result').innerHTML = "Your BMI is " + bmi;

                // Determine health status based on BMI
                var status = "";
                if (bmi < 18.5) {
                    status = "You are underweight.";
                } else if (bmi >= 18.5 && bmi < 24.9) {
                    status = "You are in a healthy weight range.";
                } else if (bmi >= 25 && bmi < 29.9) {
                    status = "You are overweight.";
                } else {
                    status = "You are obese.";
                }

                // Display the health status
                document.getElementById('status').innerHTML = status;
            } else {
                document.getElementById('result').innerHTML = "Please enter valid height and weight.";
                document.getElementById('status').innerHTML = "";
            }
        }
    </script>
</body>
</html>
