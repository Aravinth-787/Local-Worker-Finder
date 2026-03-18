from django.shortcuts import render,redirect
from django.contrib import messages
from .models import Worker, User, Booking, Feedback, Category

# Create your views here.
def home(request):
     return render(request,"home.html")

def navhome(request):
     return render(request,"home.html")

def about_us(request):
     return render(request, "about.html")

def search_worker(request):
    query=request.GET.get('query', '').strip()
    if query:
        worker=Worker.objects.filter(worker_type__icontains=query).first()
        
        if not worker:
            worker=Worker.objects.filter(category__icontains=query).first()

        if worker:
            return redirect('worker_list', category=worker.category, worker_type=worker.worker_type)
        else:
            messages.warning(request, f"No results found for '{query}'")
            
    return redirect('home')

def worker_reg(request):
     return render(request,"worker_reg.html")

def user_reg(request):
     return render(request,"user_reg.html")

# --------------- WORKER_REGISTER-------------------------------
def worker_register(request):
     if request.method=="POST":
          first_name=request.POST.get("first_name")
          last_name=request.POST.get("last_name")
          phone=request.POST.get("phone")
          email=request.POST.get("email")
          password=request.POST.get("password")
          dob=request.POST.get("dob")
          gender=request.POST.get("gender")

          worker_type=request.POST.get("worker_type")
          category=request.POST.get("category")
          experience=request.POST.get("experience")
          service_area=request.POST.get("service_area")

          state=request.POST.get("state")
          district=request.POST.get("district")
          city=request.POST.get("city")
          pincode=request.POST.get("pincode")

            # Check phone
          if Worker.objects.filter(phone=phone).exists():
            messages.warning(request, "Phone number already registered!")
            return redirect("worker_reg")

        # Check email
          if Worker.objects.filter(email=email).exists():
            messages.warning(request, "Email already registered!")
            return redirect("worker_reg")

          worker=Worker()
          worker.first_name=first_name
          worker.last_name=last_name
          worker.phone=phone
          worker.email=email
          worker.password=password
          worker.dob=dob
          worker.gender=gender

          worker.worker_type=worker_type
          worker.category=category
          worker.experience=experience
          worker.service_area=service_area

          worker.state=state
          worker.district=district
          worker.city=city
          worker.pincode=pincode

          worker.save()
          
          messages.success(request, "Worker Registered Successfully")
          return redirect("worker_reg")
     return render(request, "worker_register.html")

# --------------- USER_REGISTER-------------------------------
def user_register(request): 
    if request.method=="POST":
          first_name=request.POST.get("first_name")
          last_name=request.POST.get("last_name")
          email=request.POST.get("email")
          phone=request.POST.get("phone")
          password=request.POST.get("password")

          state=request.POST.get("state")
          district=request.POST.get("district")
          city=request.POST.get("city")
          full_address=request.POST.get("full_address")
          landmark=request.POST.get("landmark")
          pincode=request.POST.get("pincode")

             # Check phone
          if User.objects.filter(phone=phone).exists():
            messages.warning(request, "Phone number already registered!")
            return redirect("worker_reg")

        # Check email
          if User.objects.filter(email=email).exists():
            messages.warning(request, "Email already registered!")
            return redirect("worker_reg")
          
          user=User()
          user.first_name=first_name
          user.last_name=last_name
          user.email=email
          user.phone=phone
          user.password=password

          user.state=state
          user.district=district
          user.city=city
          user.full_address=full_address
          user.landmark=landmark
          user.pincode=pincode

          user.save()

          messages.success(request, "User Registered Successfully")
          return redirect("user_reg")
    return render(request, "user_reg.html")


# --------------- LOGIN & CREATE SESSION -------------------------------
def login(request):
    if request.method=="POST":
        username=request.POST.get("first_name")
        password=request.POST.get("password")

        # Admin 
        if username=="admin" and password=="admin":
            request.session.flush()
            request.session['user_type']='admin'
            request.session['name']='admin'
            return redirect("admin_dashboard")

        # Worker 
        worker=Worker.objects.filter(first_name=username, password=password)

        if worker.exists():
            request.session.flush()

            request.session['user_type']='worker'
            request.session['user_id']=worker.first().id

            request.session['name']=worker.first().first_name
            return redirect("home")

        # User 
        user=User.objects.filter(first_name=username, password=password)

        if user.exists():
            request.session.flush()

            request.session['user_type']='user'
            request.session['user_id']=user.first().id
            
            request.session['name']=user.first().first_name
            return redirect("home")

        messages.error(request, "Invalid Login")
        return redirect("home")

    return redirect("home")

# --------------- LOGOUT -------------------------------
def logout(request):
    request.session.flush()
    response=redirect('/')
    response.delete_cookie('username')
    return response


# --------------- ADMIN DASHBOARD -----------------------
def admin_dashboard(request):
    if request.session.get('user_type') != 'admin':
        return redirect("home")
    
    # Get counts
    workers_count=Worker.objects.count()
    users_count=User.objects.count()
    bookings_count=Booking.objects.count()
    feedbacks_count=Feedback.objects.count()
    
    from django.db.models import Exists, OuterRef
    workers=Worker.objects.annotate(
        is_busy=Exists(
            Booking.objects.filter(
                worker=OuterRef('pk'),
                status__in=['in_progress', 'accepted']
            )
        )
    )
    users=User.objects.all()
    bookings=Booking.objects.all()
    feedbacks=Feedback.objects.all()
    categories=Category.objects.all()
    
    context={
        'workers_count': workers_count,
        'users_count': users_count,
        'bookings_count': bookings_count,
        'feedbacks_count': feedbacks_count,
        'workers': workers,
        'users': users,
        'bookings': bookings,
        'feedbacks': feedbacks,
        'categories': categories,
    }
    
    return render(request, "admin.html", context)

# --------------- CATEGORY PAGE -----------------------
def category_page(request, type):
     mapping={

    'Home Maintenance': [
        'Plumber',
        'Electrician',
        'Mechanic (2-wheeler / 4-wheeler)',
        'AC Technician',
        'Refrigerator Technician',
        'Washing Machine Repair',
        'TV / Electronics Repair',
        'Inverter Technician',
        'RO Water Purifier Technician',
        'Gas Stove Technician',
        'Chimney / Hob Technician',
        'Water Motor Technician',
        'UPS / Battery Technician',
    ],

    'Construction Services': [
        'Mason',
        'Carpenter',
        'Painter',
        'Tile Worker',
        'Marble / Granite Worker',
        'Plaster Worker',
        'Welder',
        'Fabricator',
        'Steel Fixer',
        'Concrete Mixer Operator',
        'Demolition Worker',
        'False Ceiling Worker',
    ],

    'Cleaning Services': [
        'House Cleaner',
        'Office Cleaner',
        'Sweeper',
        'Garbage Collector',
        'Septic Tank Cleaner',
        'Drainage Cleaner',
        'Bathroom Deep Cleaner',
    ],

    'Outdoor Services': [
        'Gardener',
        'Borewell Worker',
        'Water Tank Cleaner',
        'Pest Control Worker',
        'Tree Cutter',
        'Drainage Maintenance Worker',
        'Roadside Cleaner',
        'Rainwater Harvesting Worker',
    ],

    'Installation Services': [
        'CCTV Installer',
        'Solar Panel Installer',
        'Network Cable Technician',
        'Door / Window Fitter',
        'Modular Kitchen Installer',
        'Wallpaper Installer',
        'LED Light Installer',
        'Smart Lock Installer',
        'Water Heater Installer',
    ],

    'Logistics & Labor': [
        'Driver',
        'Loader / Unloader',
        'Daily Wage Laborer',
        'Packers & Movers Helper',
    ],

    'Tailoring & Crafts': [
        'Tailor',
        'Embroidery Worker',
        'Cobbler',
        'Watch Repair',
        'Mobile Repair Technician',
        'Lock Repair (Key Maker)',
    ],

    'Food & Event Support': [
        'Cook',
        'Tea Master',
        'Juice Maker',
        'Fast Food Helper',
        'Dish Washer',
        'Catering Helper',
        'Server / Waiter',
        'Event Setup Worker',
        'Tent House Worker',
    ],

    'Personal Care': [
        'Babysitter',
        'Elder Care Worker',
        'Patient Care Assistant',
        'Home Nurse Assistant',
        'Patient Transport Helper',
    ],

    'Rural Services': [
        'Milkman',
        'Fisherman',
        'Farm Laborer',
        'Tractor Driver',
        'Poultry Worker',
        'Well Cleaner',
        'Irrigation Helper',
        'Seed Plantation Worker',
        'Organic Farming Helper',
    ],

     }

     subservices=mapping.get(type, [])

     return render(request, "category_page.html", {"subservices": subservices, "category": type})

# --------------- MY PROFILE  -----------------------
#-----------------MODIFY OUR DETAIL AND UPDATE THE DATABASE--------------
def my_profile(request):
    user_type=request.session.get("user_type")
    user_id=request.session.get("user_id")

    if not user_type:
        return redirect("home")

    pending_feedback_bookings = []
    if user_type=="worker":
        person=Worker.objects.get(id=user_id)
        bookings=Booking.objects.filter(worker=person)
        feedbacks = Feedback.objects.filter(worker=person)
    else:
        person=User.objects.get(id=user_id)
        bookings=Booking.objects.filter(user=person)
        feedbacks = Feedback.objects.filter(user=person)
        pending_feedback_bookings = bookings.filter(status='completed').exclude(id__in=Feedback.objects.filter(user=person).values_list('booking_id', flat=True))

    if request.method=="POST":
        person.first_name=request.POST.get("first_name")
        person.last_name=request.POST.get("last_name")
        person.email=request.POST.get("email")
        person.phone=request.POST.get("phone")
        person.state=request.POST.get("state")
        person.district=request.POST.get("district")
        person.city=request.POST.get("city")
        person.pincode=request.POST.get("pincode")

        if user_type=="worker":
            person.dob=request.POST.get("dob")
            person.gender=request.POST.get("gender")
            person.worker_type=request.POST.get("worker_type")
            person.category=request.POST.get("category")
            person.experience=request.POST.get("experience")
            person.service_area=request.POST.get("service_area")
        else:
            person.full_address=request.POST.get("full_address")
            person.landmark=request.POST.get("landmark")

        person.save()
        return redirect("my_profile")
        
    return render(request, "Myprofile.html", {
        "person": person, 
        "bookings": bookings,
        "feedbacks": feedbacks,
        "pending_feedback_bookings": pending_feedback_bookings
    })


# --------------- WORKER LIST ---------------------------------------
def worker_list(request, category, worker_type):
    workers=Worker.objects.filter(category=category, worker_type=worker_type)
    
    if not workers.exists():
        normalized_type=worker_type.replace(' / ', '_').replace(' ', '_')
        workers=Worker.objects.filter(category=category, worker_type=normalized_type)

    context={
        'category': category,
        'worker_type': worker_type,
        'workers': workers
    }
    
    return render(request, "worker_list.html", context)

# --------------- WORKER: UPDATE WORK PROGRESS -----------------------
def update_booking_status(request, booking_id):
    if request.method=="POST" and request.session.get('user_type')=='worker':
        try:
            booking=Booking.objects.get(id=booking_id)
            if booking.worker.id==request.session.get('user_id'):
                new_status=request.POST.get('status')
                
                booking.status=new_status 
                booking.save() 
                messages.success(request, f"Work status updated to {booking.get_status_display()}!")
        except Booking.DoesNotExist:
            messages.error(request, "Booking not found!")
            
    return redirect('my_profile')


# --------------- WORKER: ACCEPT WORK -----------------------
def accept_work(request, booking_id):
    if request.method=="POST" and request.session.get('user_type')=='worker':
        try:
            booking=Booking.objects.get(id=booking_id)
            if booking.worker.id==request.session.get('user_id'):
                booking.status='accepted'
                booking.save()
                messages.success(request, "Work Request Accepted!")
        except Booking.DoesNotExist:
            messages.error(request, "Booking not found!")
    return redirect('my_profile')


# --------------- WORKER: REJECT WORK -----------------------
def reject_work(request, booking_id):
    if request.method=="POST" and request.session.get('user_type')=='worker':
        try:
            booking=Booking.objects.get(id=booking_id)
            if booking.worker.id==request.session.get('user_id'):
                booking.status='rejected'
                booking.save()
                messages.success(request, "Work Request Rejected!")
        except Booking.DoesNotExist:
            messages.error(request, "Booking not found!")
    return redirect('my_profile')


# --------------- WORKER: NOT AVAILABLE -----------------------
def not_available_work(request, booking_id):
    if request.method=="POST" and request.session.get('user_type')=='worker':
        try:
            booking=Booking.objects.get(id=booking_id)
            if booking.worker.id==request.session.get('user_id'):
                booking.status='not_available'
                booking.save()
                messages.success(request, "Worker is Not Available!")
        except Booking.DoesNotExist:
            messages.error(request, "Booking not found!")
    return redirect('my_profile')


# --------------- USER: CONFIRM BOOKING -----------------------
def confirm_booking(request, booking_id):
    if request.method=="POST" and request.session.get('user_type')=='user':
        try:
            booking=Booking.objects.get(id=booking_id)
            if booking.user.id==request.session.get('user_id'):
                booking.status='confirmed'
                booking.save()
                messages.success(request, "Booking Confirmed!")
                return redirect('booking_confirmation', booking_id=booking.id)
        except Booking.DoesNotExist:
            messages.error(request, "Booking not found!")
    return redirect('my_profile')


# --------------- USER: CANCEL BOOKING -----------------------
def cancel_booking(request, booking_id):
    if request.method=="POST" and request.session.get('user_type')=='user':
        try:
            booking=Booking.objects.get(id=booking_id)
            if booking.user.id==request.session.get('user_id'):
                booking.status='cancelled'
                booking.save()
                messages.success(request, "Booking Request Cancelled!")
        except Booking.DoesNotExist:
            messages.error(request, "Booking not found!")
    return redirect('my_profile')


#---------------CREATE BOOKING---------------------------------------
def create_booking(request):
    if request.method=="POST" and request.session.get('user_type')=='user':
        from django.utils import timezone
        user_id=request.session.get('user_id')
        worker_id=request.POST.get('worker_id')
        service_type=request.POST.get('service_type')
        description=request.POST.get('description', '')
        
        try:
            user=User.objects.get(id=user_id)
            worker=Worker.objects.get(id=worker_id)
            
            booking=Booking(
                user=user,
                worker=worker,
                category=worker.category,
                service_type=service_type,
                scheduled_date=timezone.now().date(),
                description=description,
                status='requested'
            )
            booking.save()
            
            messages.success(request, f"Work request sent to {worker.first_name}! Check New Works in your profile.")
            return redirect('my_profile')
        except Exception as e:
            messages.error(request, f"Error creating work request: {str(e)}")
            return redirect('home')
    
    return redirect('home')

#---------------BOOKING CONFIRMATION---------------------------------------
def booking_confirmation(request, booking_id):
    try:
        booking=Booking.objects.get(id=booking_id)
        if booking.user.id!=request.session.get('user_id'):
            return redirect('home')
        
        return render(request, "booking_confirmation.html", {'booking': booking})
    except:
        messages.error(request, "Booking not found!")
        return redirect('home')

# --------------- POST FEEDBACK -----------------------+
def post_feedback(request):
    if request.session.get('user_type')!='user':
        messages.error(request, "Only users can post feedback!")
        return redirect("home")
    
    if request.method=="POST":
        user_id=request.session.get('user_id')
        booking_id=request.POST.get("booking")
        rating=request.POST.get("rating")
        comment=request.POST.get("comment")
        
        try:
            user=User.objects.get(id=user_id)
            booking=Booking.objects.get(id=booking_id)
            worker=booking.worker
            
            feedback=Feedback(
                user=user,
                worker=worker,
                booking=booking,
                rating=rating,
                comment=comment
            )
            feedback.save()
            
            messages.success(request, "Feedback Posted Successfully!")
            return redirect("my_profile")
        except:
            messages.error(request, "Error posting feedback!")
            return redirect("my_profile")
    
    return redirect("my_profile")


