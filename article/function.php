<!-- @import jquery & sweet alert  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<?php 

    function Connection(){
        $connection = new mysqli('localhost','root','','db_cms_12_1');
        return $connection;
    }


    function GetLogo($status){
        $sql = "SELECT * FROM `tbl_logo` WHERE `status` = '$status' ORDER BY `id` DESC LIMIT 1";
        $rs  = Connection()->query($sql);
        $row = mysqli_fetch_assoc($rs);
        echo $row['thumnail'];
    }

    function GetNews($category){
        $sql = "SELECT * FROM `tbl_news` WHERE `category` = '$category' ORDER BY `id` DESC LIMIT 3";
        $rs  = Connection()->query($sql);
        while($row = mysqli_fetch_assoc($rs)){
            echo '
                <div class="col-4">
                    <figure>
                        <a href="news-detail.php?id='.$row['id'].'&category='.$row['category'].'">
                            <div class="thumbnail">
                                <img src="../admin/assets/image/'.$row['thumnail'].'" alt="" width="350px" height="200px" style="object-fit:cover;">
                            <div class="title">
                                '.$row['title'].'
                            </div>
                            </div>
                        </a>
                    </figure>
                </div>
            
            ';
        }
    }

    function get_viewer($id){
        $get_viewer = "SELECT `viewer` FROM `tbl_news` WHERE `id` ='$id'";
        $rs_viewer  = Connection()->query($get_viewer);
        $row_viewer = mysqli_fetch_assoc($rs_viewer);
        $old_viewer = $row_viewer['viewer'];
        $new_viewer = $old_viewer+1;

        $viewer_update = "UPDATE `tbl_news` set `viewer` = '$new_viewer' WHERE `id` = '$id'";
        $rs_update = Connection()->query($viewer_update);
    }

    function Get_news_detail(){
        $id = $_GET['id'];

        get_viewer($id);

        $sql = "SELECT * FROM `tbl_news` WHERE `id` = '$id'";
        $rs  = Connection()->query($sql);
        $row = mysqli_fetch_assoc($rs);
        echo '

            <div class="main-news">
                <div class="thumbnail">
                    <img src="../admin/assets/image/'.$row['banner'].'" width="730px" height="415" style="object-fit:cover">
                </div>
                <div class="detail">
                    <h3 class="title">'.$row['title'].'</h3>
                    <div class="date">'.$row['post_date'].'</div>
                    <div class="description">
                        '.$row['description'].'
                    </div>
                </div>
            </div>
        
        ';
    }

    function Popular_news(){
        $sql = "SELECT * FROM `tbl_news` ORDER BY `viewer` DESC LIMIT 1";
        $rs  = Connection()->query($sql);
        $row = mysqli_fetch_assoc($rs);
        echo '
            <figure>
                <a href="news-detail.php?id='.$row['id'].'&category='.$row['category'].'">
                    <div class="thumbnail">
                        <img src="../admin/assets/image/'.$row['thumnail'].'" width="730px" height="415" style="object-fit:cover">
                        <div class="title">
                            '.$row['title'].'
                        </div>
                    </div>
                </a>
            </figure>
        ';
    }

    function min_popular(){
        
        $sql_id = "SELECT `id` FROM `tbl_news` ORDER BY `viewer` DESC LIMIT 1";
        $rs_id = Connection()->query($sql_id);
        $row_id = mysqli_fetch_assoc($rs_id);
        $pop_id =  $row_id['id'];

        $sql = "SELECT * FROM `tbl_news` WHERE `id` !='$pop_id' ORDER BY `viewer` DESC LIMIT 2";
        $rs  = Connection()->query($sql);
        while($row = mysqli_fetch_assoc($rs)){
            echo '
                <div class="col-12">
                    <figure>
                        <a href="news-detail.php?id='.$row['id'].'&category='.$row['category'].'">
                            <div class="thumbnail">
                                <img src="../admin/assets/image/'.$row['thumnail'].'" width="350px" height="200px" style="object-fit:cover">
                                <div class="title">
                                    '.$row['title'].'
                                </div>
                            </div>
                        </a>
                    </figure>
                </div>
            ';
        }
    }


    function Trading_news(){
        $sql = "SELECT * FROM `tbl_news` ORDER BY `viewer` DESC LIMIT 2";
        $rs  = Connection()->query($sql);
        while($row = mysqli_fetch_assoc($rs)){
            echo '
                <i class="fas fa-angle-double-right"></i>
                <a href="news-detail.php?id='.$row['id'].'&category='.$row['category'].'">'.$row['title'].'</a> &ensp;
            ';
        }
    }
    
    function RelateNews($category,$id){
        $sql = "SELECT * FROM `tbl_news` WHERE `category` = '$category' AND `id`!='$id' ORDER BY `id` DESC LIMIT 2";
        $rs  = Connection()->query($sql);
        while($row = mysqli_fetch_assoc($rs)){
            echo '
                <figure>
                    <a href="news-detail.php?id='.$row['id'].'&category='.$row['category'].'">
                        <div class="thumbnail">
                        <img src="../admin/assets/image/'.$row['thumnail'].'" alt="" width="350px" height="200px" style="object-fit:cover;">
                        </div>
                        <div class="detail">
                            <h3 class="title">'.$row['title'].'</h3>
                            <div class="date">'.$row['post_date'].'</div>
                            <div class="description">
                                '.$row['description'].'
                            </div>
                        </div>
                    </a>
                </figure>
            
            ';
        }
    }


    function getNewsByCategory($category,$news_type){

        if(empty($_GET['page'])){
            $page = 1;
        }
        else{
            $page = $_GET['page'];
        }

        $start = ($page-1)*3;


        $sql = "SELECT * FROM `tbl_news` WHERE `category` = '$category' && `news-type` = '$news_type' ORDER BY `id` DESC LIMIT $start,3";
        $rs  = Connection()->query($sql);
        for(;$row = mysqli_fetch_assoc($rs);){
            echo '
            <div class="col-4">
                <figure>
                    <a href="news-detail.php?id='.$row['id'].'&category='.$row['category'].'">
                        <div class="thumbnail">
                            <img src="../admin/assets/image/'.$row['thumnail'].'" alt="" width="350px" height="200px" style="object-fit:cover;">
                        </div>
                        <div class="detail">
                            <h3 class="title">'.$row['title'].'</h3>
                            <div class="date">'.$row['post_date'].'</div>
                            <div class="description">
                                '.$row['description'].'
                            </div>
                        </div>
                    </a>
                </figure>
            </div>
            ';
        }
    }

    function get_pagenation($category,$news_type){
        $sql = "SELECT COUNT(`id`) as 'Total' FROM `tbl_news` WHERE `category` = '$category' and `news-type` = '$news_type'";
        $rs = Connection()->query($sql);
        $row = mysqli_fetch_assoc($rs);
        $total_news = $row['Total'];//4
        $total_page = ceil($total_news/3);
        for($i=1;$i<=$total_page;$i++){
            echo '
                <li>
                    <a href="'.$category.'-news-'.$news_type.'.php?page='.$i.'">'.$i.'</a>
                </li>
            ';
        }
    }

    function Search(){
        $search = $_GET['query'];
        $sql = "SELECT * FROM `tbl_news` WHERE `title` LIKE '%$search%'";
        $rs = Connection()->query($sql);
        while($row = mysqli_fetch_assoc($rs)){
            echo '
            <div class="col-4">
                <figure>
                    <a href="news-detail.php?id='.$row['id'].'&category='.$row['category'].'">
                        <div class="thumbnail">
                            <img src="../admin/assets/image/'.$row['thumnail'].'" alt="" width="350px" height="200px" style="object-fit:cover;">
                        </div>
                        <div class="detail">
                            <h3 class="title">'.$row['title'].'</h3>
                            <div class="date">'.$row['post_date'].'</div>
                            <div class="description">
                                '.$row['description'].'
                            </div>
                        </div>
                    </a>
                </figure>
            </div>
            ';
        }
    }




?>




