$template = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="referrer" content="strict-origin-when-cross-origin" />
    <title>Thali by Thali - Episode {{ID}}</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
</head>
<body>

    <!-- Header -->
    <header>
        <div class="container">
            <nav>
                <div class="logo">
                     <a href="../index.html">
                         <img src="../assets/logo_small.png" alt="Thali by Thali" style="height: 100px; width: auto;">
                     </a>
                </div>
                <div class="burger-menu" id="burger-menu">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <ul class="nav-links">
                    <li><a href="../index.html">Home</a></li>
                    <li><a href="../about.html">About Us</a></li>
                    <li><a href="../projects.html" class="active">Resources</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Video Section -->
    <section class="section">
        <div class="container video-detail">
            <div class="video-header">
                <h1>Episode {{ID}}: {{TITLE}}</h1>
                <p><a href="../projects.html">&larr; Back to all episodes</a></p>
            </div>

            <!-- Top Video Link / Embed -->
            <div class="video-container">
                <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/{{VIDEO_ID}}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>

            <div style="margin-top: 2rem;">
                <h3>About this Episode</h3>
                <div class="episode-description">
                    {{DESCRIPTION}}
                </div>
            </div>

            <div class="video-resources">
                <h3>Learning Resources</h3>
                <ul>
                    <li><a href="#">Read about {{TOPIC}} history</a></li>
                    <li><a href="#">Recipe: Traditional {{TOPIC}}</a></li>
                    <li><a href="#">Interview with the chef</a></li>
                </ul>
            </div>

            <!-- Bottom Video Link (Navigation) -->
            <div class="video-bottom-link">
                {{NAV_LINKS}}
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2026 Historically Tempered Collective. All rights reserved.</p>
        </div>
    </footer>

    <script src="../js/main.js"></script>
</body>
</html>
"@

$episodes = @(
    @{
        ID = 1;
        Title = "What were the Harappan's eating?";
        VideoID = "m8q-ZZzH0PQ";
        Topic = "Harappan Food";
        Description = @"
<p>What were people eating during the Harappan / Indus Valley Civilisation?<br>
And more importantly — how do we know?</p>

<p>In this episode of Indian History: Thali by Thali, we speak with archaeologists Dr. Jaya Menon and Dr. Supriya Varma, whose decades of fieldwork and research help us understand everyday life in the Harappan world.</p>

<p>Together, we explore diet, culture, trade, and how Harappans lived all those thousands of years ago.</p>

<p>Some questions to facilitate further discussions :<br>
1. How do archaeologists use evidence to reconstruct the everyday lives of ancient people, such as their diets and cooking practices?<br>
2. What does food tell us about social organisation in Harappa?<br>
3. In what way did geography influence what the Harappans ate?<br>
4. Why are there still uncertainties about the Harappans' food and cooking methods, and what challenges do historians face in filling these gaps?</p>
"@
    },
    @{
        ID = 2;
        Title = "What were people eating in Early India?";
        VideoID = "uSSAy85boBU";
        Topic = "Early India";
        Description = @"
<p>What were people eating in Early India?<br>
And more importantly — how do we know?</p>

<p>In this episode of Indian History: Thali by Thali, we speak with historian of early India, Romila Thapar, to understand how historians investigate what early Indians ate and drank given the limited and indirect sources from this time.</p>

<p>Together, we explore diet, culture, trade, and how early Indians lived nearly two thousand years ago.</p>
"@
    },
    @{
        ID = 3;
        Title = "What were people eating in Early Southern India?";
        VideoID = "oDUc-MSe3hM";
        Topic = "Early South India";
        Description = @"
<p>What were people eating in early southern India?<br>
And more importantly, how do we know?</p>

<p>In this episode of Indian History: Thali by Thali, we speak with archaeologist V. Selvakumar about food in early South India and what archaeological and textual evidence reveals about daily life in the past.</p>

<p>Drawing on evidence from sites such as Keeladi, along with inscriptions and material culture, this episode explores what people ate in southern India between 12,000 years ago and about 1,700 years ago, and how food connects to trade networks, technology, art, and social life. It is a conversation about early Indian history, archaeology, and how historians reconstruct the past.</p>
"@
    },
    @{
        ID = 4;
        Title = "What were people in the Gupta Empire eating?";
        VideoID = "wuocBJIOXpI";
        Topic = "Gupta Empire";
        Description = @"
<p>Was the Gupta Empire really the Golden Age of India?</p>

<p>In Episode 4 of Indian History: Thali by Thali, we look beyond the textbook label and ask what the evidence actually tells us. With historians Kunal Chakrabarti and Kanad Sinha, we explore the Gupta period through archaeological evidence, inscriptions, coins and classical texts to understand new political formations, the rise of Vaishnava and other Hindu iconography, elite courtly culture and ordinary lives.</p>

<p>And of course, we return to our central question: what was on the Gupta plate? What do the sources reveal about food, and who had access to it?</p>

<p>This episode rethinks the idea of a “golden age” and asks a simple but important question: golden for whom?</p>
"@
    }
)

foreach ($ep in $episodes) {
    $i = $ep.ID
    
    $content = $template -replace "\{\{ID\}\}", "$i"
    $content = $content -replace "\{\{TITLE\}\}", $ep.Title
    $content = $content -replace "\{\{TOPIC\}\}", $ep.Topic
    $content = $content -replace "\{\{VIDEO_ID\}\}", $ep.VideoID
    $content = $content -replace "\{\{DESCRIPTION\}\}", $ep.Description

    # Navigation Logic
    $navLinks = ""
    if ($i -gt 1) {
        $prev = $i - 1
        $navLinks += "<a href='video-$prev.html' style='margin-right: 20px;'>&larr; Previous Episode</a>"
    } else {
         $navLinks += "<span style='margin-right: 20px; color: #ccc;'>&larr; Previous Episode</span>"
    }

    if ($i -lt 4) {
        $next = $i + 1
        $navLinks += "<a href='video-$next.html' style='font-weight: bold;'>Next Episode &rarr;</a>"
    } else {
         # Last available video loops back to projects
         $navLinks += "<a href='../projects.html' style='font-weight: bold;'>Back to Project List &rarr;</a>"
    }

    $content = $content -replace "\{\{NAV_LINKS\}\}", "$navLinks"

    $fileName = "videos/video-$i.html"
    Set-Content -Path $fileName -Value $content
    Write-Host "Created $fileName"
}
