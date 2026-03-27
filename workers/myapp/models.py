from django.db import models

# Create your models here.
# ###########  WORKER_REG------------------------------------------
class Worker(models.Model):

    # ---------------- Personal Details ----------------
    first_name=models.CharField(max_length=100)
    last_name=models.CharField(max_length=100)
    phone=models.CharField(max_length=10, unique=True)
    email=models.EmailField(unique=True)
    password=models.CharField(max_length=128)  
    dob=models.DateField()
    gender=models.CharField(max_length=20)

    # ---------------- Work Details ----------------
    worker_type=models.CharField(max_length=100)
    category=models.CharField(max_length=100)
    experience=models.PositiveIntegerField()
    service_area=models.CharField(max_length=100)

    # ---------------- Address ----------------
    state=models.CharField(max_length=100)
    district=models.CharField(max_length=100)
    city=models.CharField(max_length=100)
    pincode=models.CharField(max_length=6)

    # ---------------- Registered date creation  ----------------
    created_at=models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = "worker_register"
        ordering = ['-created_at']

############### USER_REG----------------------------------------
class User(models.Model):

    # ---------------- Personal Details ----------------
    first_name=models.CharField(max_length=100)
    last_name=models.CharField(max_length=100)
    email=models.EmailField(unique=True)
    phone=models.CharField(max_length=10, unique=True)
    password=models.CharField(max_length=128)  

    # ---------------- Address ----------------
    state=models.CharField(max_length=100)
    district=models.CharField(max_length=100)
    city=models.CharField(max_length=100)
    full_address=models.CharField(max_length=100)
    landmark=models.CharField(max_length=50)
    pincode=models.CharField(max_length=6)


     # ---------------- Registered date creation  ----------------
    created_at=models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = "user_register"
        ordering = ['-created_at']

#---------------CATEGORY---------------------------------------
class Category(models.Model):
    home_maintenance=models.CharField(max_length=100)
    construction_services=models.CharField(max_length=100)
    cleaning_services=models.CharField(max_length=100)
    outdoor_services=models.CharField(max_length=100)
    installation_services=models.CharField(max_length=100)
    logistics_labor=models.CharField(max_length=100)
    tailoring_crafts=models.CharField(max_length=100)
    food_event_support=models.CharField(max_length=100)
    personal_care=models.CharField(max_length=100)
    rural_services=models.CharField(max_length=100)

    class Meta:
        db_table="category"

#---------------BOOKING---------------------------------------
class Booking(models.Model):
    STATUS_CHOICES=[
        ('requested', 'Requested'),
        ('accepted', 'Accepted'),
        ('rejected', 'Rejected'),
        ('not_available', 'Not Available'),
        ('confirmed', 'Confirmed'),
        ('started', 'Work Started'),
        ('in_progress', 'In Progress'),
        ('almost_done', 'Almost Done'),
        ('completed', 'Completed'),
        ('cancelled', 'Cancelled'),
    ]
    
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    worker=models.ForeignKey(Worker, on_delete=models.CASCADE)
    booking_date=models.DateTimeField(auto_now_add=True)
    scheduled_date=models.DateField()
    category=models.CharField(max_length=100)
    service_type=models.CharField(max_length=100)
    status=models.CharField(max_length=20, choices=STATUS_CHOICES, default='requested')
    description=models.TextField()


    class Meta:
        db_table="booking"
        ordering = ['-booking_date']


#---------------USER FEEDBACK---------------------------------------
class Feedback(models.Model):
    RATING_CHOICES = [
        (1, '1 Star'),
        (2, '2 Stars'),
        (3, '3 Stars'),
        (4, '4 Stars'),
        (5, '5 Stars'),
    ]
    
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    worker=models.ForeignKey(Worker, on_delete=models.CASCADE)
    booking=models.ForeignKey(Booking, on_delete=models.CASCADE)
    rating=models.IntegerField(choices=RATING_CHOICES)
    comment=models.TextField()
    upload_image=models.ImageField(upload_to='feedback_images/', blank=True, null=True)
    upload_image2=models.ImageField(upload_to='feedback_images/', blank=True, null=True)
    upload_image3=models.ImageField(upload_to='feedback_images/', blank=True, null=True)
    created_at=models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table="feedback"
        ordering = ['-created_at'] 

