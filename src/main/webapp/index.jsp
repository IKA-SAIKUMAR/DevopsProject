<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BMI Calculator with Calculator Feature</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e0f7fa;
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
            margin-bottom: 10px;
        }
        button:hover {
            background-color: #004d40;
        }
        .result, .status {
            margin-top: 20px;
            font-size: 1.4em;
            color: #004d40;
        }
        /* Calculator Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .calculator-buttons {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }
        .calculator-buttons button {
            padding: 15px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            background-color: #00796b;
            color: white;
            cursor: pointer;
        }
        .calculator-buttons button:hover {
            background-color: #004d40;
        }
        .calculator-display {
            font-size: 24px;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #e0f7fa;
            border: 1px solid #00796b;
            border-radius: 5px;
            text-align: right;
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
        <button onclick="openCalculator()">Open Calculator</button>
        <div class="result" id="result"></div>
        <div class="status" id="status"></div>
    </div>

    <!-- Calculator Modal -->
    <div class="modal" id="calculatorModal">
        <div class="modal-content">
            <div class="calculator-display" id="calculatorDisplay">0</div>
            <div class="calculator-buttons">
                <button onclick="appendToDisplay('7')">7</button>
                <button onclick="appendToDisplay('8')">8</button>
                <button onclick="appendToDisplay('9')">9</button>
                <button onclick="appendToDisplay('/')">÷</button>
                <button onclick="appendToDisplay('4')">4</button>
                <button onclick="appendToDisplay('5')">5</button>
                <button onclick="appendToDisplay('6')">6</button>
                <button onclick="appendToDisplay('*')">×</button>
                <button onclick="appendToDisplay('1')">1</button>
                <button onclick="appendToDisplay('2')">2</button>
                <button onclick="appendToDisplay('3')">3</button>
                <button onclick="appendToDisplay('-')">−</button>
                <button onclick="appendToDisplay('0')">0</button>
                <button onclick="appendToDisplay('.')">.</button>
                <button onclick="calculate()">=</button>
                <button onclick="appendToDisplay('+')">+</button>
                <button onclick="clearDisplay()">C</button>
            </div>
        </div>
    </div>

    <script>
        function calculateBMI() {
            var feet = document.getElementById('feet').value;
            var inches = document.getElementById('inches').value;
            var weight = document.getElementById('weight').value;

            var totalInches = (parseFloat(feet) * 12) + parseFloat(inches);
            var heightInMeters = totalInches * 0.0254;

            if (heightInMeters > 0 && weight > 0) {
                var bmi = weight / (heightInMeters * heightInMeters);
                bmi = bmi.toFixed(2);

                document.getElementById('result').innerHTML = "Your BMI is " + bmi;
                var status = bmi < 18.5 ? "You are underweight." :
                            bmi < 24.9 ? "You are in a healthy weight range." :
                            bmi < 29.9 ? "You are overweight." :
                                         "You are obese.";
                document.getElementById('status').innerHTML = status;
            } else {
                document.getElementById('result').innerHTML = "Please enter valid height and weight.";
                document.getElementById('status').innerHTML = "";
            }
        }

        // Calculator functionality
        function openCalculator() {
            document.getElementById('calculatorModal').style.display = 'flex';
        }

        function clearDisplay() {
            document.getElementById('calculatorDisplay').innerText = '0';
        }

        function appendToDisplay(value) {
            const display = document.getElementById('calculatorDisplay');
            if (display.innerText === '0') display.innerText = value;
            else display.innerText += value;
        }

        function calculate() {
            const display = document.getElementById('calculatorDisplay');
            try {
                display.innerText = eval(display.innerText);
            } catch (e) {
                display.innerText = 'Error';
            }
        }

        // Close modal on outside click
        window.onclick = function(event) {
            const modal = document.getElementById('calculatorModal');
            if (event.target === modal) modal.style.display = "none";
        }
    </script>
</body>
</html>
