// Type PIECE
// Specification fonctionnelle du type PIECE
protocol Piece {
    
    //Permet de récuperer la forme de la piece
    var forme : String { get }
    
    //Permet de récuperer la couleur de la piece
    var couleur : String { get }
    
    //une piece est definie par un sa forme (string) et sa couleur (string)
    init(forme : String, couleur : String)
}


// Structure de donnees du type PIECE
struct Piece : Piece{
    
    // declaration de la propriete forme pour un pion
    private(set) var forme : String
    
    // declaration de la propriete couleur pour un pion
    private(set) var couleur : String
    
    // initialisation d'un pion qui a une forme et une couleur
    init(forme : String, couleur : String) {
        self.forme = forme
        self.couleur = couleur
    }
}

// Type JOUEUR
// Specification fonctionnelle du type JOUEUR
protocol Joueur {
    
    //Recupere le numéro du joueur
    var numero : Int { get } 
    
    //Renvoie la liste des pieces dispo pour le joueur sous forme de String
    var description : String { get }
    
    //Un joueur est definit par un numéro de joueur et un lot de pieces, la fonction init fait donc appel a SetLotDePieces. Le joueur 1 aura automatiquement les blancs et le 2 les rouges.
    init(numero : Int /*,description : String ?????????? */)
    
    //Supprime la piece du lot de piece du joueur
    mutating func SupprimerPiece (p : Piece)
    
    //Verifie si le joueur possede la piece
    func PossedePiece (p : Piece) -> Bool
    
    //attribue a un joueur les pieces pour démarrer (deux cylindre, deux carrés, deux spheres et deux pyramides) sous forme de liste. Recupere le numéro du joueur pour savoir quelle couleur attribuer aux pieces
    func setLotDePieces () ->  [Piece]
}

// Structure de donnees du type JOUEUR
struct Joueur : Joueur {
    private(set) var numero : Int  // declaration de la propriete numero pour un joueur
    private(set) var description : String  // declaration de la propriete description pour un pion

    init(numero : Int,description : String){ // initialisation d'un joueur qui a un numero et une description
        self.numero = numero
        self.description = description
        
        //var lotdP = self.setLotDePieces
        //self.lotdP =
    }

    mutating func SupprimerPiece (p : Piece){
        
    }
    
    func PossedePiece (p : Piece){
        return (nbOccurence (pieces : self.setLotDePieces(), p : p)> 0)
    }
    
    
    
    
    
    private func nbOccurence (pieces : [Piece], p : Piece) -> Int {
        var resultat : Int = 0
        for i in 0..< pieces.count {
            if pieces[i] == piece {
                resultat = resultat + 1
            }
    
        }

        return resultat
    }
    
    func setLotDePieces () ->  [Piece]{
        
    }
    
    
    
}
//Type PLATEAU
// Specification fonctionnelle du type PLATEAU
protocol Plateau {
    
    //Un plateau est un tableau (de taille 3  /NON : 4) de tableaux (de taille 3 /NON: 4) de types Piece ou nul.
    //Il est initialisé entierement à nul. On repere une position dans le tableau grace a une
    //liste de 2 int, le premier donne la colonne et le deuxieme la ligne.
    init ()

    //Renvoie l'ensemble des positions où il y a une piece
    func PositionsPieces () -> [(Int, Int)]
    
    //Renvoie le type et la couleur de la piece pour une position donnée, renvoie nul si vide
    func QuellePiece (position : (Int,Int)) -> Piece?
    
    //Verifie si le joueur peut placer la piece c'est a dire :les fonctions estVidePos, Pcolonne, Psection et Pligne
    // renvoient true et la fonction PossedePiece renvoie true. Si tout ca est possible, modifie le plateau et place
    // la piece a la position donnée. Renvoie false et ne modifie rien sinon.
    mutating func place (position : (Int, Int)) -> Bool
    
    //Renvoie true si la position selectionée est vide
    func estVidePos (position : (Int,Int)) -> Bool
    
    //Si il y a une piece de couleur differente et de meme forme dans
    //la colonne renvoie false, true sinon
    func Pcolonne (position : (Int, Int)) -> Bool
    
    //Si il y a une piece de couleur differente et de meme forme dans la ligne
    //renvoie false, true sinon
    func Pligne (position : (Int, Int)) -> Bool
    
    //Si il y a une piece de couleur differente et de meme forme dans la zone
    //(il y a 4 zone, c'est un carré de 2*2) renvoie false, true sinon
    func Pzone (position : (Int, Int)) -> Bool
    
    //Verifie les pieces disponibles du joueur et si il peut en placer
    //au moins une, revoie true, false sinon
    func peutJouer (j : Joueur) -> Bool
    
    //Si Gcolonne ou Gligne ou Gzone renvoient true ou peutJouer de
    //l'adversaire renvoie false, aGagne revoie true, false sinon
    func aGagne() -> Bool
    
    //Si il ya a 4 pieces de forme differentes dans la colonne, renvoie
    //true, false sinon
    func Gcolonne (position : (Int, Int)) -> Bool
    
    //Si il ya a 4 pieces de forme differentes dans la ligne,
    //renvoie true, false sinon
    func Gligne (position : (Int, Int)) -> Bool
    
    //Si il ya a 4 pieces de forme differentes dans la zone,
    //renvoie true, false sinon
    func Gzone (position : (Int, Int)) -> Bool
}

struct Plateau : Plateau {
    
    private var grille
    
    init() {
        // tableau de taille 4 pas de taille 3 On peut faire comme on veut il ne faut pas imposer
        
    }
    
    func aGagne() -> Bool {
        return Gzone() && Gligne() && Gzone()
    }
    
    func Gzone(position : (Int,Int)) -> Bool {
        
    }
    func Gligne(position : (Int,Int)) -> Bool {
        let l : Int = position.0
        for i in self {
            <#code#>
        }
    }
    func Gcolonne(position : (Int,Int)) -> Bool {
        
    }
}
