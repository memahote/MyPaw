//
//  ForumViewModel.swift
//  MyPaw
//
//  Created by Larderet on 12/11/2025.
//

import SwiftUI

@Observable
class ForumViewModel {
    // État pour le filtre sélectionné
    var selectedFilter = "Tous"
    
    // Liste des filtres disponibles
    let filters = ["Tous", "Alimentation", "Sevrage", "Jeux"]
    
    // Bannière mise en avant
    let banniereItem = GuideItem(
        id: 1,
        title: "Mon chat bouge-t'il assez ?",
        type: "Activité",
        isBanner: true,
        description: "Activité physique, jeux, exercices... Découvrez les conseils des professionnels du secteur",
        backgroundImage: "",
        overlayColor: .clear,
        sections: [
            GuideSection(type: .heading, content: "L'importance de l'activité physique"),
            GuideSection(type: .paragraph, content: "L'exercice physique est essentiel pour la santé et le bien-être de votre chat. Un chat actif est un chat heureux et en meilleure santé."),
            
            GuideSection(type: .heading, content: "Combien d'exercice par jour ?"),
            GuideSection(type: .paragraph, content: "En moyenne, un chat adulte devrait avoir au moins 20 à 30 minutes d'activité physique intense par jour, répartie en plusieurs sessions."),
            GuideSection(type: .bulletList, content: "• Chatons (3-6 mois) : 30-45 min par jour\n• Chats adultes : 20-30 min par jour\n• Chats seniors : 15-20 min par jour"),
            
            GuideSection(type: .tip, content: "💡 Astuce : Préférez plusieurs courtes sessions de jeu plutôt qu'une longue session. Les chats ont des bursts d'énergie naturels !"),
            
            GuideSection(type: .heading, content: "Signes d'un chat pas assez actif"),
            GuideSection(type: .bulletList, content: "• Prise de poids excessive\n• Comportement destructeur\n• Agressivité ou anxiété\n• Miaulements nocturnes\n• Léthargie excessive"),
            
            GuideSection(type: .warning, content: "⚠️ Un manque d'exercice peut entraîner l'obésité, le diabète et des problèmes articulaires chez le chat."),
            
            GuideSection(type: .heading, content: "Idées d'activités"),
            GuideSection(type: .paragraph, content: "Voici quelques activités pour stimuler votre chat :"),
            GuideSection(type: .bulletList, content: "• Jouets à plumes ou cannes à pêche\n• Lasers (toujours terminer par une vraie capture)\n• Balles et souris en peluche\n• Parcours d'agilité maison\n• Jeux de cache-cache\n• Roue d'exercice pour chats"),
            
            GuideSection(type: .paragraph, content: "En maintenant votre chat actif, vous contribuez à sa longévité et à sa qualité de vie. L'exercice renforce aussi votre lien avec lui !")
        ],
        author: "Dr. Laurent Petit",
        readingTime: "7 min",
        coverImage: "kiki"
    )
    
    // Liste complète des guides
    let guides = [
        GuideItem(
            id: 2,
            title: "Vie de Chat",
            type: "Alimentation",
            description: "Qu'est-ce que fait votre chat quand vous n'êtes pas là ?",
            backgroundImage: "imgforum1",
            overlayColor: Color.darkBrown.opacity(0.65),
            buttonColor: .darkBrown,
            sections: [
                GuideSection(type: .heading, content: "Introduction"),
                GuideSection(type: .paragraph, content: "Les chats sont des créatures fascinantes qui mènent une double vie. Pendant que vous êtes au travail, votre compagnon félin s'adonne à diverses activités qui pourraient vous surprendre."),
                
                GuideSection(type: .heading, content: "Les activités typiques"),
                GuideSection(type: .paragraph, content: "Voici ce que fait généralement votre chat durant votre absence :"),
                GuideSection(type: .bulletList, content: "• Dormir (12-16 heures par jour)\n• Observer par la fenêtre\n• Jouer avec ses jouets\n• Patrouiller son territoire\n• Se toiletter méticuleusement\n• Manger et boire\n• Faire ses griffes"),
                
                GuideSection(type: .tip, content: "💡 Astuce : Installez une caméra pour animaux pour observer votre chat à distance et vous assurer qu'il va bien."),
                
                GuideSection(type: .heading, content: "Le cycle de sommeil"),
                GuideSection(type: .paragraph, content: "Les chats sont des dormeurs experts. Ils peuvent dormir jusqu'à 16 heures par jour ! Ce sommeil est réparti en petites siestes tout au long de la journée et de la nuit."),
                GuideSection(type: .bulletList, content: "• Phase de sommeil léger : 15-30 minutes\n• Phase de sommeil profond : 5 minutes\n• Réveil et surveillance : quelques minutes\n• Puis le cycle recommence"),
                
                GuideSection(type: .heading, content: "Signes d'ennui"),
                GuideSection(type: .paragraph, content: "Si votre chat s'ennuie seul, il peut développer des comportements indésirables. Voici les signes à surveiller :"),
                GuideSection(type: .bulletList, content: "• Destruction de meubles ou objets\n• Miaulements excessifs\n• Comportement agressif au retour\n• Léchage compulsif\n• Troubles du sommeil\n• Perte d'appétit"),
                
                GuideSection(type: .warning, content: "⚠️ Attention : Un chat qui s'ennuie peut développer de l'anxiété de séparation. Consultez un vétérinaire si nécessaire."),
                
                GuideSection(type: .heading, content: "Solutions pour l'occuper"),
                GuideSection(type: .paragraph, content: "Pour garder votre chat stimulé pendant votre absence :"),
                GuideSection(type: .bulletList, content: "• Laissez des jouets interactifs\n• Installez un arbre à chat près d'une fenêtre\n• Utilisez des distributeurs de friandises puzzle\n• Adoptez un deuxième chat pour lui tenir compagnie\n• Laissez la radio ou la télévision allumée\n• Créez un parcours d'exploration vertical\n• Cachez des friandises dans la maison"),
                
                GuideSection(type: .heading, content: "L'enrichissement environnemental"),
                GuideSection(type: .paragraph, content: "L'enrichissement de l'environnement est crucial pour le bien-être de votre chat :"),
                GuideSection(type: .bulletList, content: "• Perchoirs en hauteur pour observer\n• Cachettes et tunnels\n• Griffoirs variés (horizontaux et verticaux)\n• Accès à une fenêtre\n• Herbe à chat fraîche\n• Rotation régulière des jouets"),
                
                GuideSection(type: .paragraph, content: "En comprenant mieux le comportement de votre chat, vous pouvez créer un environnement enrichissant qui répond à ses besoins naturels, même en votre absence.")
            ],
            author: "Dr. Marie Dubois",
            readingTime: "8 min",
            coverImage: "imgforum1"
        ),
        
        GuideItem(
            id: 3,
            title: "Chat Heureux",
            type: "Sevrage",
            description: "Est-ce que votre chat est heureux ? Faites le test.",
            backgroundImage: "imgForum2",
            overlayColor: Color.orangeDeep.opacity(0.65),
            buttonColor: .orangeDeep,
            sections: [
                GuideSection(type: .heading, content: "Comment savoir si votre chat est heureux ?"),
                GuideSection(type: .paragraph, content: "Le bonheur d'un chat s'exprime de manière subtile. Apprenez à reconnaître les signes d'un félin épanoui pour mieux répondre à ses besoins."),
                
                GuideSection(type: .heading, content: "Les 10 signes d'un chat heureux"),
                GuideSection(type: .bulletList, content: "• Queue dressée en point d'interrogation\n• Ronronnements réguliers et profonds\n• Clignements lents des yeux\n• Pétrissage avec les pattes (\"faire des biscuits\")\n• Bon appétit et hydratation régulière\n• Toilettage régulier mais non compulsif\n• Postures détendues et ventre exposé\n• Jeux spontanés et comportement joueur\n• Sommeil paisible dans différents endroits\n• Recherche active de votre compagnie"),
                
                GuideSection(type: .tip, content: "💡 Un chat qui vous montre son ventre vous fait confiance, mais attention, ce n'est pas toujours une invitation à le caresser ! C'est plutôt un signe de relaxation totale."),
                
                GuideSection(type: .heading, content: "Le langage corporel du bonheur"),
                GuideSection(type: .paragraph, content: "Les chats communiquent beaucoup par leur langage corporel :"),
                GuideSection(type: .bulletList, content: "• Oreilles orientées vers l'avant : curiosité et intérêt\n• Moustaches détendues : contentement\n• Queue haute et mobile : confiance\n• Yeux mi-clos : sérénité\n• Corps détendu : bien-être général"),
                
                GuideSection(type: .heading, content: "Signes d'inquiétude"),
                GuideSection(type: .paragraph, content: "À l'inverse, certains comportements indiquent un mal-être ou du stress :"),
                GuideSection(type: .bulletList, content: "• Agressivité soudaine ou inhabituelle\n• Perte d'appétit prolongée\n• Isolement et évitement\n• Vocalises excessives (surtout la nuit)\n• Malpropreté ou changement d'habitudes\n• Léchage compulsif jusqu'à perte de poils\n• Pupilles dilatées en permanence\n• Queue basse ou entre les pattes"),
                
                GuideSection(type: .warning, content: "⚠️ Si votre chat présente plusieurs de ces signes pendant plus de 48 heures, consultez un vétérinaire pour écarter tout problème de santé sous-jacent."),
                
                GuideSection(type: .heading, content: "Le test du bonheur félin"),
                GuideSection(type: .paragraph, content: "Répondez à ces questions pour évaluer le bien-être de votre chat :"),
                GuideSection(type: .bulletList, content: "1. Votre chat ronronne-t-il régulièrement ?\n2. Joue-t-il au moins 15 minutes par jour ?\n3. Dort-il paisiblement dans différents endroits ?\n4. Vient-il vous chercher pour des câlins ?\n5. Son pelage est-il brillant et bien entretenu ?\n6. Mange-t-il avec appétit ?\n7. Est-il curieux de son environnement ?\n8. Utilise-t-il sa litière sans problème ?"),
                GuideSection(type: .paragraph, content: "Si vous avez répondu \"oui\" à 6 questions ou plus, félicitations ! Votre chat semble heureux et épanoui."),
                
                GuideSection(type: .heading, content: "Comment rendre votre chat plus heureux"),
                GuideSection(type: .paragraph, content: "Créez un environnement stimulant et sécurisant :"),
                GuideSection(type: .bulletList, content: "• Respectez ses routines quotidiennes\n• Offrez-lui des cachettes et espaces en hauteur\n• Jouez quotidiennement avec lui (minimum 15 min)\n• Gardez sa litière impeccablement propre\n• Proposez différentes textures de couchage\n• Laissez-le observer l'extérieur en sécurité\n• Maintenez des horaires de repas réguliers\n• Créez une routine de brossage agréable\n• Parlez-lui avec une voix douce\n• Respectez ses moments de solitude"),
                
                GuideSection(type: .tip, content: "💡 Chaque chat est unique ! Apprenez à connaître les préférences spécifiques de votre compagnon pour maximiser son bonheur."),
                
                GuideSection(type: .heading, content: "L'importance de la routine"),
                GuideSection(type: .paragraph, content: "Les chats sont des animaux d'habitudes. Une routine stable les rassure et contribue grandement à leur bien-être émotionnel. Essayez de maintenir des horaires constants pour :"),
                GuideSection(type: .bulletList, content: "• Les repas\n• Les séances de jeu\n• Le nettoyage de la litière\n• Vos départs et retours\n• Le coucher"),
                
                GuideSection(type: .paragraph, content: "Un chat heureux est un chat en bonne santé. Prenez le temps d'observer votre compagnon et d'adapter votre environnement à ses besoins uniques. Le bonheur de votre chat passe par l'attention que vous lui portez au quotidien !")
            ],
            author: "Sophie Martin",
            readingTime: "10 min",
            coverImage: "imgForum2"
        ),
        
        GuideItem(
            id: 4,
            title: "Jeux et stimulation",
            type: "Jeux",
            description: "Des activités ludiques pour le bien-être de votre animal.",
            backgroundImage: "imgForum3",
            overlayColor: Color.orangeMid.opacity(0.65),
            buttonColor: .orangeMid,
            sections: [
                GuideSection(type: .heading, content: "Pourquoi jouer avec son chat ?"),
                GuideSection(type: .paragraph, content: "Le jeu est essentiel pour le bien-être physique et mental de votre chat. Il permet de simuler la chasse, de brûler de l'énergie et de renforcer votre lien."),
                
                GuideSection(type: .heading, content: "Les bienfaits du jeu"),
                GuideSection(type: .bulletList, content: "• Maintien d'un poids santé\n• Prévention de l'ennui et de l'anxiété\n• Développement de l'agilité\n• Stimulation mentale\n• Renforcement du lien avec vous\n• Réduction des comportements destructeurs\n• Amélioration de la qualité du sommeil"),
                
                GuideSection(type: .tip, content: "💡 Les sessions de jeu sont plus efficaces juste avant les repas, car elles imitent le cycle naturel chasse-repas-toilettage-sommeil du chat."),
                
                GuideSection(type: .heading, content: "Types de jouets recommandés"),
                GuideSection(type: .paragraph, content: "Variez les types de jouets pour maintenir l'intérêt de votre chat :"),
                GuideSection(type: .bulletList, content: "• Jouets à plumes (simulent les oiseaux)\n• Cannes à pêche interactives\n• Balles légères et rapides\n• Souris en peluche\n• Jouets distributeurs de friandises\n• Tunnels et sacs en papier\n• Pointeurs laser (avec précautions)\n• Jouets motorisés\n• Herbe à chat et valériane"),
                
                GuideSection(type: .heading, content: "Règles d'or pour le jeu"),
                GuideSection(type: .bulletList, content: "• Durée : 10-15 minutes par session\n• Fréquence : 2-3 sessions par jour minimum\n• Intensité : Alternez phases actives et calmes\n• Terminez toujours par une \"capture\" réussie\n• Rangez les jouets après pour garder l'intérêt\n• Variez les jouets régulièrement"),
                
                GuideSection(type: .warning, content: "⚠️ Attention avec les lasers : Ne pointez jamais vers les yeux et terminez toujours la session avec un vrai jouet que le chat peut \"attraper\". La frustration de ne jamais capturer peut causer de l'anxiété."),
                
                GuideSection(type: .heading, content: "Jeux DIY (fait maison)"),
                GuideSection(type: .paragraph, content: "Vous pouvez créer des jouets stimulants avec des objets du quotidien :"),
                GuideSection(type: .bulletList, content: "• Boules de papier froissé\n• Bouchons de liège\n• Cartons percés de trous\n• Rouleaux de papier toilette\n• Boîtes avec cachettes\n• Bouteilles en plastique avec croquettes\n• Glaçons dans la baignoire (par temps chaud)"),
                
                GuideSection(type: .tip, content: "💡 Fabriquez un \"jardin d'herbe à chat\" dans une caisse peu profonde. C'est un enrichissement naturel que votre chat adorera !"),
                
                GuideSection(type: .heading, content: "Adapter le jeu selon l'âge"),
                GuideSection(type: .paragraph, content: "Les besoins en jeu évoluent avec l'âge :"),
                GuideSection(type: .bulletList, content: "• Chatons : Sessions courtes et fréquentes, jouets variés pour exploration\n• Adultes : Jeux plus structurés, défis intellectuels\n• Seniors : Jeux plus doux, moins intenses mais réguliers\n• Surpoids : Augmentez progressivement la durée des sessions"),
                
                GuideSection(type: .heading, content: "Enrichissement mental"),
                GuideSection(type: .paragraph, content: "Au-delà du jeu physique, stimulez l'intellect de votre chat :"),
                GuideSection(type: .bulletList, content: "• Distributeurs de friandises puzzle\n• Cacher des jouets dans la maison\n• Entraînement au clicker\n• Nouveaux parcours d'exploration\n• Rotation d'accès aux pièces\n• Jeux de recherche olfactive"),
                
                GuideSection(type: .heading, content: "Signes d'un chat bien stimulé"),
                GuideSection(type: .bulletList, content: "• Poids santé maintenu\n• Comportement calme la nuit\n• Moins de miaulements excessifs\n• Pas de destruction de mobilier\n• Bonne humeur générale\n• Sommeil réparateur\n• Interaction positive avec vous"),
                
                GuideSection(type: .paragraph, content: "Le jeu n'est pas un luxe, c'est une nécessité pour votre chat ! En investissant 20-30 minutes par jour dans le jeu, vous offrez à votre compagnon une vie épanouie et heureuse. Un chat qui joue est un chat en bonne santé physique et mentale !")
            ],
            author: "Thomas Leroy",
            readingTime: "9 min",
            coverImage: "imgForum3"
        ),
        
        GuideItem(
            id: 5,
            title: "Au dodo Annick",
            type: "Alimentation",
            description: "Et si le sommeil de votre chat pouvait changer votre vie ?",
            backgroundImage: "imgForum4",
            overlayColor: Color.darkBrown.opacity(0.65),
            buttonColor: .darkBrown,
            sections: [
                GuideSection(type: .heading, content: "Le sommeil du chat : un mystère fascinant"),
                GuideSection(type: .paragraph, content: "Votre chat dort 12 à 16 heures par jour, soit environ 70% de sa vie ! Comprendre son sommeil peut transformer votre cohabitation et améliorer votre propre repos."),
                
                GuideSection(type: .heading, content: "Pourquoi les chats dorment-ils autant ?"),
                GuideSection(type: .paragraph, content: "Le sommeil excessif des chats est un héritage de leurs ancêtres sauvages :"),
                GuideSection(type: .bulletList, content: "• Conservation d'énergie pour la chasse\n• Digestion de protéines carnées\n• Récupération musculaire\n• Traitement des informations\n• Régulation de la température\n• Croissance (pour les chatons)"),
                
                GuideSection(type: .tip, content: "💡 Les chatons et les chats âgés peuvent dormir jusqu'à 20 heures par jour, c'est tout à fait normal !"),
                
                GuideSection(type: .heading, content: "Les phases du sommeil félin"),
                GuideSection(type: .paragraph, content: "Les chats ont un cycle de sommeil unique :"),
                GuideSection(type: .bulletList, content: "• Sommeil léger (15-30 min) : prêt à réagir, oreilles mobiles\n• Sommeil profond (5-7 min) : rêves, mouvements oculaires\n• Micro-réveils : surveillance de l'environnement\n• Retour au sommeil léger"),
                GuideSection(type: .paragraph, content: "Ce cycle se répète toute la journée. Les phases de sommeil profond ne représentent que 25% du temps total de sommeil."),
                
                GuideSection(type: .heading, content: "Est-ce que les chats rêvent ?"),
                GuideSection(type: .paragraph, content: "Oui ! Pendant le sommeil paradoxal (REM), les chats rêvent probablement de chasse. Vous pouvez observer :"),
                GuideSection(type: .bulletList, content: "• Mouvements des pattes\n• Contractions des moustaches\n• Petits miaulements\n• Mouvements oculaires rapides\n• Oreilles qui bougent"),
                
                GuideSection(type: .warning, content: "⚠️ Ne réveillez jamais brutalement un chat qui rêve ! Il pourrait être désorienté et réagir de façon défensive."),
                
                GuideSection(type: .heading, content: "Le problème des miaulements nocturnes"),
                GuideSection(type: .paragraph, content: "Votre chat vous réveille la nuit ? Voici les causes principales :"),
                GuideSection(type: .bulletList, content: "• Faim (surtout tôt le matin)\n• Ennui et surplus d'énergie\n• Solitude ou anxiété\n• Chaleurs (chats non stérilisés)\n• Problèmes médicaux (hyperthyroïdie, douleur)\n• Instinct crépusculaire non satisfait\n• Manque de routine"),
                
                GuideSection(type: .heading, content: "Solutions pour dormir en paix"),
                GuideSection(type: .paragraph, content: "Voici comment synchroniser le sommeil de votre chat avec le vôtre :"),
                GuideSection(type: .bulletList, content: "• Session de jeu intense 1h avant le coucher\n• Repas principal le soir (imitant chasse-repas-sommeil)\n• Ignorez les miaulements nocturnes (ne récompensez pas)\n• Distributeur automatique pour le petit matin\n• Routine de coucher stable\n• Environnement calme la nuit\n• Enrichissement diurne pour fatiguer le chat\n• Fermeture de la chambre si nécessaire"),
                
                GuideSection(type: .tip, content: "💡 La règle d'or : \"Chasse (jeu) + Repas + Toilettage = Sommeil\". Reproduisez ce cycle naturel avant votre propre coucher !"),
                
                GuideSection(type: .heading, content: "Créer un espace de sommeil idéal"),
                GuideSection(type: .paragraph, content: "Les chats adorent avoir plusieurs options de couchage :"),
                GuideSection(type: .bulletList, content: "• Lits douillets dans des endroits calmes\n• Perchoirs en hauteur pour la sécurité\n• Cachettes type grotte pour l'intimité\n• Proximité d'une source de chaleur\n• Vue sur l'extérieur ou l'entrée\n• Variété de textures (molletonné, frais, rugueux)"),
                
                GuideSection(type: .heading, content: "Quand s'inquiéter ?"),
                GuideSection(type: .paragraph, content: "Consultez un vétérinaire si vous observez :"),
                GuideSection(type: .bulletList, content: "• Changement soudain des habitudes de sommeil\n• Sommeil excessif + léthargie\n• Insomnie persistante\n• Désorientation au réveil\n• Ronflements forts et soudains\n• Difficulté à trouver une position confortable"),
                
                GuideSection(type: .warning, content: "⚠️ Un chat senior qui dort beaucoup plus que d'habitude peut souffrir de douleurs articulaires ou d'autres problèmes de santé."),
                
                GuideSection(type: .heading, content: "Les bienfaits d'un bon sommeil"),
                GuideSection(type: .paragraph, content: "Un chat qui dort bien est :"),
                GuideSection(type: .bulletList, content: "• Plus sociable et affectueux\n• Moins anxieux ou agressif\n• En meilleure santé générale\n• Plus joueur et curieux\n• Doté d'un système immunitaire renforcé\n• Moins sujet aux troubles du comportement"),
                
                GuideSection(type: .paragraph, content: "En comprenant et en respectant les besoins de sommeil de votre chat, vous créez une harmonie qui bénéficie à toute la maisonnée. Un chat bien reposé la journée est un chat qui vous laisse dormir la nuit ! Bonne nuit Annick, et bon dodo à votre chat ! 😴🐱")
            ],
            author: "Dr. Annick Rousseau",
            readingTime: "11 min",
            coverImage: "imgForum4"
        )
    ]
    
    // Computed property pour filtrer les guides
    var filteredGuides: [GuideItem] {
        selectedFilter == "Tous" ? guides : guides.filter { $0.type == selectedFilter }
    }
}
