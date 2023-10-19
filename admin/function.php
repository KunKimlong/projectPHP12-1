<!-- @sweet alert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- @script -->
<script src="assets/js/jquery.min.js"></script>
<?php 
    function Connection(){
        $connection = new mysqli('localhost','root','','db_cms_12_1');
        return $connection;
    }
    function Register(){
        if(isset($_POST['btn_register'])){
            $username = $_POST['username'];
            $email    = $_POST['email'];
            $password = $_POST['password'];
            $profile  = $_FILES['profile']['name'];  
            if(!empty($username) && !empty($email) && !empty($password) && !empty($profile)){
                $profile = date('dmyhis').'_'.$profile;
                $path    = './assets/admin_image/'.$profile;
                move_uploaded_file($_FILES['profile']['tmp_name'],$path);
                
                $password = md5($password);

                $sql = "INSERT INTO `tbl_user`(`username`, `email`, `password`, `profile`) VALUES ('$username','$email','$password','$profile')";
                $rs  = Connection()->query($sql);
                if($rs){
                    header('location:login.php');
                }
            }
        }
    }
    Register();

    session_start();
    function Login(){
        if(isset($_POST['btn_login'])){
            $name_email = $_POST['name_email'];
            $password   = $_POST['password'];
            if(!empty($name_email) && !empty($password)){
                $password = md5($password);
                $sql = "SELECT * FROM `tbl_user` WHERE (`username`='$name_email' OR `email`='$name_email') AND `password` = '$password'";
                $rs  = Connection()->query($sql);
                $row = mysqli_fetch_assoc($rs);
                if(!empty($row)){
                    $id  = $row['id'];
                    $_SESSION['user'] = $id;
                   header('location:index.php');  
                }
                else{
                    echo '
                        <script>
                            $(document).ready(function(){
                                swal({
                                    title: "Error 404 not found",
                                    text: "We can no find this account",
                                    icon: "error",
                                    button: "Back",
                                  });
                            });
                        </script>
                    ';
                }
            }
        }
    }
    Login();

    function Logout(){
        if(isset($_POST['btn-logout'])){
            unset($_SESSION['user']);
        }
    }
    Logout();

    function Add_logo(){
        if(isset($_POST['btn-add-logo'])){
            // echo 123;

            $status = $_POST['status'];
            $thumnail = $_FILES['thumnail']['name'];
            $tmp_thumnail = $_FILES['thumnail']['tmp_name'];

            if(!empty($status) && !empty($thumnail)){
                $thumnail = date('dmyhis').'_'.$thumnail;
                $path = './assets/Logo/'.$thumnail;
                move_uploaded_file($tmp_thumnail,$path);


                $sql = "INSERT INTO `tbl_logo`(`thumnail`, `status`) VALUES('$thumnail','$status')";
                $rs = Connection()->query($sql);
                if($rs){
                    echo '
                    <script>
                        $(document).ready(function(){
                            swal({
                                title: "Success",
                                text: "Logo Insert Success",
                                icon: "success",
                                button: "Done",
                            });
                        });
                    </script>
                    ';
                }
            }
            else{
                echo '
                <script>
                    $(document).ready(function(){
                        swal({
                            title: "Error",
                            text: "Logo Can not  Insert",
                            icon: "error",
                            button: "Done",
                        });
                    });
                </script>
                ';
            }
        }
    }
    Add_logo();

    function GetLogo(){
        $sql = "SELECT * FROM `tbl_logo` ORDER BY `id` DESC";
        $rs  = Connection()->query($sql);
        while($row = mysqli_fetch_assoc($rs)){
            echo '
                    <tr>
                        <td><img src="./assets/Logo/'.$row['thumnail'].'" width="80px" hieght="80px"/></td>
                        <td>'.$row['status'].'</td>
                        <td>'.$row['create_at'].'</td>
                        <td width="150px">
                            <a href="update-logo.php?id='.$row['id'].'" class="btn btn-primary">Update</a>
                            <button type="button" remove-id="'.$row['id'].'" class="btn btn-danger btn-remove" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Remove
                            </button>
                        </td>
                    </tr>
            ';
        }
    }

    function Update(){
        if(isset($_POST['btn-update-logo'])){
            $id = $_GET['id'];
            $status = $_POST['status'];
            $thumnail = $_FILES['thumnail']['name'];
            $tmp_thumnail = $_FILES['thumnail']['tmp_name'];
            if(empty($thumnail)){
                $thumnail = $_POST['old_thumnail'];
            }
            else{
                $thumnail = date('dmyhis').'_'.$thumnail;
                $path = './assets/Logo/'.$thumnail;
                move_uploaded_file($tmp_thumnail,$path);
            }
            if(!empty($status) && !empty($thumnail)){
                $sql = "UPDATE `tbl_logo` SET `thumnail`='$thumnail',`status`='$status' WHERE `id` = '$id'";
                $rs = Connection()->query($sql);
                if($rs){
                    echo '
                    <script>
                        $(document).ready(function(){
                            swal({
                                title: "Success",
                                text: "Logo Update Success",
                                icon: "success",
                                button: "Done",
                            });
                        });
                    </script>
                    ';
                }
            }
        }

    }
    Update();

    function Delete_logo(){
        if(isset($_POST['btn-delete-logo'])){
            $delete_id = $_POST['remove_id'];

            $sql = "DELETE FROM `tbl_logo` WHERE `id` = '$delete_id'";
            $rs = Connection()->query($sql);
            if($rs){
                echo '
                    <script>
                        $(document).ready(function(){
                            swal({
                                title: "Success",
                                text: "Logo Delete Success",
                                icon: "success",
                                button: "Done",
                            });
                        });
                    </script>
                    ';
            }
         }
    }
    Delete_logo();


    function Add_News(){
        if(isset($_POST['btn-add-news'])){
            $post_by   = $_SESSION['user'];
            $title     = $_POST['title'];
            $category  = $_POST['category'];
            $news_type = $_POST['news_type'];
            $thumnail  = $_FILES['thumnail']['name'];
            $banner    = $_FILES['banner']['name'];
            $description = $_POST['description'];
            if(!empty($title) && !empty($news_type) && !empty($category) && !empty($thumnail) && !empty($banner) && !empty($description)){
                $thumnail = date('dmyhis').'_'.$thumnail;
                $path = './assets/image/'.$thumnail;

                move_uploaded_file($_FILES['thumnail']['tmp_name'],$path);

                $banner = date('dmyhis').'_'.$banner;
                $path = './assets/image/'.$banner;

                move_uploaded_file($_FILES['banner']['tmp_name'],$path);


                $sql = "INSERT INTO `tbl_news`(`title`, `description`, `thumnail`, `banner`,`post_by`,`category`, `news-type`) VALUES ('$title','$description','$thumnail','$banner','$post_by','$category','$news_type')";
                $rs  = Connection()->query($sql);
                if($rs){
                    echo '
                    <script>
                        $(document).ready(function(){
                            swal({
                                title: "Success",
                                text: "News Insert Success",
                                icon: "success",
                                button: "Done",
                            });
                        });
                    </script>
                    ';
                }

            }
        }
    }
    Add_News();


    function Get_News(){
        if(empty($_GET['page'])){
            $page = 1;
        }
        else{
            $page = $_GET['page'];
        }
        // echo $page;
        //page = 2
        $total_news = ($page-1)*5;
        $sql = "SELECT tbl_user.username , tbl_news.* FROM tbl_news INNER JOIN tbl_user ON tbl_news.post_by = tbl_user.id ORDER BY `id` DESC LIMIT $total_news,5";
        $rs = Connection()->query($sql);
        while($row = mysqli_fetch_assoc($rs)){
            echo '
                <tr>
                    <td class="title">'.$row['title'].'</td>
                    <td class="des">'.$row['description'].'</td>
                    <td>'.$row['category'].'</td>
                    <td>'.$row['news-type'].'</td>
                    <td><img src="./assets/image/'.$row['thumnail'].'" width="80px" height="80px" style="object-fit:cover"/></td>
                    <td><img src="./assets/image/'.$row['banner'].'" width="80px" height="80px" style="object-fit:cover"/></td>
                    <td>'.$row['username'].'</td>
                    <td>'.$row['viewer'].'</td>
                    <td>'.$row['post_date'].'</td>
                    <td width="150px">
                        <a href="update-post-news.php?id='.$row['id'].'"class="btn btn-primary">Update</a>
                        <button type="button" remove-id="'.$row['id'].'" class="btn btn-danger btn-remove" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Remove
                        </button>
                    </td>
                </tr>
            ';
        }
    }


    function Remove_news(){
        if(isset($_POST['btn-remove-news'])){
            $remove_id = $_POST['remove_id'];
            $sql = "DELETE FROM `tbl_news` WHERE `id` = '$remove_id'";
            $rs  = Connection()->query($sql);
            if($rs){
                echo '
                    <script>
                        $(document).ready(function(){
                            swal({
                                title: "Success",
                                text: "News Delete Success",
                                icon: "success",
                                button: "Done",
                            });
                        });
                    </script>
                ';
            }
        }
    }
    Remove_news();

    function update_news(){
       if(isset($_POST['btn-update-news'])){

            $id = $_GET['id'];

            $post_by   = $_SESSION['user'];
            $title     = $_POST['title'];
            $category  = $_POST['category'];
            $news_type = $_POST['news_type'];
            $thumnail  = $_FILES['thumnail']['name'];
            $old_thumnail = $_POST['old_thumnail'];
            $banner    = $_FILES['banner']['name'];
            $old_banner =  $_POST['old_banner'];
            $description = $_POST['description'];
            if(empty($thumnail)){
                $thumnail = $old_thumnail;
            }
            else{
                $thumnail = date('dmyhis').'_'.$thumnail;
                $path = './assets/image/'.$thumnail;

                move_uploaded_file($_FILES['thumnail']['tmp_name'],$path);
            }
            if(empty($banner)){
                $banner = $old_banner;
            }
            else{
                $banner = date('dmyhis').'_'.$banner;
                $path = './assets/image/'.$banner;

                move_uploaded_file($_FILES['banner']['tmp_name'],$path);
            }

            if(!empty($title) && !empty($news_type) && !empty($category)  && !empty($description)){
                $sql = "UPDATE `tbl_news` SET `title`='$title',`description`='$description',`thumnail`='$thumnail',`banner`='$banner',`post_by`='$post_by',`category`='$category',`news-type`='$news_type' WHERE `id`='$id'"; 
                $rs  = Connection()->query($sql);
                if($rs){
                    echo '
                        <script>
                            $(document).ready(function(){
                                swal({
                                    title: "Success",
                                    text: "News Update Success",
                                    icon: "success",
                                    button: "Done",
                                });
                            });
                        </script>
                    ';
                }
            }
            
       }

    }
    update_news();


    function get_pagenation($table){
        $sql = "SELECT COUNT(`id`) as 'total' FROM `$table`";
        $rs  = Connection()->query($sql);
        $row = mysqli_fetch_assoc($rs);
        $total_news =  $row['total'];
        $total_page = ceil($total_news/5);
        for($i = 1 ; $i<=$total_page;$i++){
            echo '
                <li>
                    <a href="view-post-news.php?page='.$i.'">'.$i.'</a>
                </li>
            ';
        }
    }
        
?>