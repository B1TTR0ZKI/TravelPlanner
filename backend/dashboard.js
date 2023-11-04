document.addEventListener("DOMContentLoaded", function() {
    const images = [
        "assets/egypt.jpeg",
        "assets/long.jpeg",
        "assets/rome.jpeg",
        "assets/hitlerparis.jpeg",
        "assets/sproe.jpeg"
    ];
    const imageInfo = [
        {
            title: "Explore the Mysteries of Egypt",
            description: "Discover the ancient wonders and rich history of Egypt."
        },
        {
            title: "Vibrant Life in London",
            description: "Experience the bustling streets and iconic landmarks of London."
        },
        {
            title: "Romantic Adventures in Rome",
            description: "Indulge in the romantic charm and exquisite culture of Rome."
        },
        {
            title: "Elegance and Glamour in Paris",
            description: "Immerse yourself in the elegance and glamour of the City of Light."
        },
        {
            title: "Sensory Delights in Singapore",
            description: "Treat your senses to the diverse culinary and cultural experiences of Singapore."
        }
    ];

    let currentImageIndex = 0;
    const slideshowImage = document.querySelector(".slideshow-container img");
    const infoBox = document.querySelector(".info-box");
    const exploreButton = document.querySelector(".explore-button");
    const bookButton = document.querySelector(".book-button");

    function updateImage() {
        slideshowImage.src = images[currentImageIndex];
        infoBox.querySelector("h2").textContent = imageInfo[currentImageIndex].title;
        infoBox.querySelector("p").textContent = imageInfo[currentImageIndex].description;
    }

    function showNextImage() {
        currentImageIndex = (currentImageIndex + 1) % images.length;
        updateImage();
    }

    function showPrevImage() {
        currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
        updateImage();
    }

    updateImage();

    const nextButton = document.querySelector(".arrow-button.right");
    const prevButton = document.querySelector(".arrow-button.left");

    nextButton.addEventListener("click", showNextImage);
    prevButton.addEventListener("click", showPrevImage);

    exploreButton.addEventListener("click", showNextImage);
    bookButton.addEventListener("click", showNextImage);

    fetch("database/auth.php")
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const user_name = data.username;
                if (user_name) {
                    const welcomeMessage = `Welcome, ${user_name}!`;
                    document.getElementById("welcomemsg").textContent = welcomeMessage;
                    document.getElementById("welcome-popup").style.display = "block"; // Show the welcome popup
                }
            }
        })
        .catch(error => {
            console.error("Fetch error: " + error);
        });

    xhr.send();
});
