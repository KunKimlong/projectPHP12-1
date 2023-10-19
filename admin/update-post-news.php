<?php 
    include('sidebar.php');

    $id = $_GET['id'];
    $rs = Connection()->query("SELECT * FROM `tbl_news` WHERE `id` = '$id'");
    $row = mysqli_fetch_assoc($rs);
?>
                <div class="col-10">
                    <div class="content-right">
                        <div class="top">
                            <h3>Add Sport News</h3>
                        </div>
                        <div class="bottom">
                            <figure>
                                <form method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input type="text" name="title" value="<?php echo $row['title'] ?>" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>Category:</label>
                                        <select class="form-select" name="category">
                                            <option value="Sport" <?php if($row['category']=="Sport") echo "selected"?>  >Sport</option>
                                            <option value="Socail" <?php if($row['category']=="Socail") echo "selected"?> >Socail</option>
                                            <option value="Entertainment" <?php if($row['category']=="Entertainment") echo "selected"?> >Entertainment</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>News type:</label>
                                        <select class="form-select" name="news_type">
                                            <option value="National" <?php if($row['news-type']=="National") echo "selected"?>  >National</option>
                                            <option value="International" <?php if($row['news-type']=="International") echo "selected"?>  >International</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Thumnail: <span style="color:red">Recommend size 350x200</span></label>
                                        <input type="file" id="thumnail" name="thumnail" class="form-control">
                                        <input type="hidden" name="old_thumnail" value="<?php echo $row['thumnail'] ?>" id="">
                                        <img src="./assets/image/<?php echo $row['thumnail'] ?>" id="img-thumnail" alt="" width="150px" height="100px">
                                    </div>
                                    <div class="form-group">
                                        <label>Banner: <span style="color:red">Recommend size 730x415</span> </label>
                                        <input type="file" id="banner" name="banner" class="form-control">
                                        <input type="hidden" name="old_banner" value="<?php echo $row['banner'] ?>" id="">
                                        <img src="./assets/image/<?php echo $row['banner'] ?>" id="img-banner" alt="" width="150px" height="100px">
                                    </div>
                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea class="form-control" name="description">
                                            <?php echo $row['description'] ?>
                                        </textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" name="btn-update-news" class="btn btn-warning">Update</button>
                                    </div>
                                </form>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
<script>
    $(document).ready(function(){
        $("#thumnail").change(function(){
            $("#img-thumnail").hide();
        }); 
        $("#banner").change(function(){
            $("#img-banner").hide();
        }); 
    });
</script>
</html>