from django.urls import path
from myapp import views

urlpatterns=[
    path("",views.home,name="home"),
    path("navhome",views.navhome,name="navhome"),
    path("worker_reg",views.worker_reg,name="worker_reg"),
    path("user_reg",views.user_reg,name="user_reg"),
    path("worker_register",views.worker_register,name="worker_register"),
    path("user_register",views.user_register,name="user_register"),
    path("login",views.login,name="login"),
    path("logout",views.logout,name="logout"),
    path("category/<str:type>/", views.category_page, name="category_page"),
    path("my_profile",views.my_profile,name="my_profile"),
    path("about_us",views.about_us,name="about_us"),
    path("search_worker",views.search_worker,name="search_worker"),
    path("admin_dashboard",views.admin_dashboard,name="admin_dashboard"),

    path("update_booking_status/<int:booking_id>/",views.update_booking_status,name="update_booking_status"),
    path("post_feedback",views.post_feedback,name="post_feedback"),
    
    path("workers/<str:category>/<path:worker_type>/", views.worker_list, name="worker_list"),
    path("create_booking", views.create_booking, name="create_booking"),
    path("booking_confirmation/<int:booking_id>/", views.booking_confirmation, name="booking_confirmation"),
    path("accept_work/<int:booking_id>/", views.accept_work, name="accept_work"),
    path("reject_work/<int:booking_id>/", views.reject_work, name="reject_work"),
    path("not_available_work/<int:booking_id>/", views.not_available_work, name="not_available_work"),
    path("confirm_booking/<int:booking_id>/", views.confirm_booking, name="confirm_booking"),
    path("cancel_booking/<int:booking_id>/", views.cancel_booking, name="cancel_booking"),
]