<?php 
    include('sidebar.php');

    $id = $_GET['id'];
    $rs = Connection()->query("SELECT * FROM `tbl_logo` WHERE `id` = $id");
    $row = mysqli_fetch_assoc($rs);
    // echo $row['status'];
?>
                <div class="col-10">
                    <div class="content-right">
                        <div class="top">
                            <h3>Add Logo</h3>
                        </div>
                        <div class="bottom">
                            <figure>
                                <form method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select class="form-select" name="status">
                                            <option value="All" <?php if($row['status']=="All") echo 'selected';  ?>>All</option>
                                            <option value="Header" <?php if($row['status']=="Header") echo 'selected';  ?>>Header</option>
                                            <option value="Footer" <?php if($row['status']=="Footer") echo 'selected';  ?>>Footer</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>File</label>
                                        <input type="file" name="thumnail" id="thumnail" class="form-control">
                                        <input type="hidden" name="old_thumnail" id="" value="<?php echo $row['thumnail']; ?>">
                                        <img src="./assets/Logo/<?php echo $row['thumnail']; ?>" alt="" width="100px" height="90px">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" name="btn-update-logo" class="btn btn-primary">Submit</button>
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
            $("img").hide();
        });
    });
</script>
</html>