<?php
// Database credentials
$host = 'localhost';
$dbname = 'digitaldb';
$username = 'root';
$password = '';

try {
    // Connect to database
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch products with associated images
    $stmt = $pdo->query("
        SELECT p.id, p.title, p.summary, i.file AS image_file, i.alt AS image_alt
        FROM product p
        LEFT JOIN image i ON p.image_id = i.id
        ORDER BY p.id
        LIMIT 9
    ");
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die("Database error: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products Gallery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            padding: 20px;
        }
        h1 {
            text-align: center;
        }
        .grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .product-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 30%; /* 3 columns */
            text-align: center;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .product-card img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .product-card h3 {
            margin: 10px 0 5px;
        }
        .product-card p {
            font-size: 0.9rem;
            color: #555;
        }
        @media (max-width: 900px) {
            .product-card { width: 45%; } /* 2 columns on smaller screens */
        }
        @media (max-width: 600px) {
            .product-card { width: 100%; } /* 1 column on mobile */
        }
    </style>
</head>
<body>

    <h1>Products Gallery</h1>
    <div class="grid">
        <?php foreach ($products as $product): ?>
            <div class="product-card">
                <?php if ($product['image_file']): ?>
                    <img src="uploads/<?= htmlspecialchars($product['image_file']); ?>" alt="<?= htmlspecialchars($product['image_alt']); ?>">
                <?php else: ?>
                    <img src="images/placeholder.png" alt="No Image">
                <?php endif; ?>
                <h3><?= htmlspecialchars($product['title']); ?></h3>
                <p><?= htmlspecialchars($product['summary']); ?></p>
            </div>
        <?php endforeach; ?>
    </div>

</body>
</html>