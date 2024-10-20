<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vota tus Sitios Favoritos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 10px 0;
        }
        select {
            padding: 5px;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <h1>Vota tus Sitios Favoritos</h1>
    <form id="votingForm">
        <ul>
            <li>Mallorca: <select class="vote" id="mallorca">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Cerdeña-Cagliari: <select class="vote" id="cerdena">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Marruecos (Marrakech-Tanger): <select class="vote" id="marruecos">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Malta (La Valeta): <select class="vote" id="malta">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Albania: <select class="vote" id="albania">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Marsella: <select class="vote" id="marsella">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Amsterdam: <select class="vote" id="amsterdam">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Ibiza: <select class="vote" id="ibiza">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Conil: <select class="vote" id="conil">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Suiza en general: <select class="vote" id="suiza">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Lisboa: <select class="vote" id="lisboa">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
            <li>Bruselas: <select class="vote" id="bruselas">
                <option value="0">Elige tu puntuación</option>
                <option value="1">1 punto</option>
                <option value="2">2 puntos</option>
                <option value="3">3 puntos</option>
            </select></li>
        </ul>
        <button type="submit" id="submitBtn" disabled>Enviar Votos</button>
    </form>

    <script>
        const form = document.getElementById('votingForm');
        const submitBtn = document.getElementById('submitBtn');
        const voteSelects = document.querySelectorAll('.vote');

        function updateButtonState() {
            const selectedValues = Array.from(voteSelects).map(select => parseInt(select.value));
            const totalPoints = selectedValues.reduce((acc, value) => acc + value, 0);

            submitBtn.disabled = totalPoints !== 6; // Activar el botón solo si la suma es 6 puntos (3+2+1)
        }

        voteSelects.forEach(select => {
            select.addEventListener('change', updateButtonState);
        });

        form.addEventListener('submit', function(event) {
            event.preventDefault();

            const votes = {};
            voteSelects.forEach(select => {
                votes[select.id] = parseInt(select.value);
            });

            localStorage.setItem('votos', JSON.stringify(votes));
            alert('¡Tus votos han sido registrados!');

            // Aquí podrías enviar los datos al servidor mediante una petición AJAX en lugar de localStorage
        });
    </script>
</body>
</html>
