<?php 
    include('header.php'); 
    
?>
<main class="news-detail">
    <section>
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <?php Get_news_detail(); ?>
                </div>
                <div class="col-4">
                    <div class="relate-news">
                        <h3 class="main-title">Related News</h3>
                        <?php 
                            $id = $_GET['id'];
                            $category = $_GET['category'];
                            RelateNews($category,$id);
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<?php include('footer.php'); ?>