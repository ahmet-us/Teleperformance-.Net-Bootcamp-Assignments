﻿// <auto-generated />
using System;
using Listing_Queue_BackgroundServices.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace Listing_Queue_BackgroundServices.Migrations
{
    [DbContext(typeof(SocialNetworkDbContext))]
    partial class SocialNetworkDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.6")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.GroupProfile", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("GroupName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("GroupProfiles");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.PostComment", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("CommentText")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("Created")
                        .HasColumnType("datetime2");

                    b.Property<int>("PostId")
                        .HasColumnType("int");

                    b.Property<int>("PrivateMessageId")
                        .HasColumnType("int");

                    b.Property<int>("PublicMessageId")
                        .HasColumnType("int");

                    b.Property<int>("SourceId")
                        .HasColumnType("int");

                    b.Property<int>("UserProfileId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("PrivateMessageId");

                    b.HasIndex("PublicMessageId");

                    b.HasIndex("UserProfileId");

                    b.ToTable("PostComments");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.PrivateMessage", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<DateTime>("Created")
                        .HasColumnType("datetime2");

                    b.Property<int>("GroupProfileId")
                        .HasColumnType("int");

                    b.Property<string>("MediaLocation")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("SourceId")
                        .HasColumnType("int");

                    b.Property<int>("TargetId")
                        .HasColumnType("int");

                    b.Property<int>("UserProfileId")
                        .HasColumnType("int");

                    b.Property<string>("WrittenText")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("GroupProfileId");

                    b.HasIndex("UserProfileId");

                    b.ToTable("PrivateMessages");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.PublicMessage", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("MediaLocation")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("SourceId")
                        .HasColumnType("int");

                    b.Property<int>("UserProfileId")
                        .HasColumnType("int");

                    b.Property<string>("WrittenText")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("UserProfileId");

                    b.ToTable("PublicMessages");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.UserProfile", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Country")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("DateOfBirth")
                        .HasColumnType("datetime2");

                    b.Property<string>("EmailAddress")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("UserName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("UserSurname")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("UserProfiles");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.PostComment", b =>
                {
                    b.HasOne("Listing_Queue_BackgroundServices.Data.PrivateMessage", "PrivateMessage")
                        .WithMany("PostComments")
                        .HasForeignKey("PrivateMessageId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Listing_Queue_BackgroundServices.Data.PublicMessage", "PublicMessage")
                        .WithMany("PostComments")
                        .HasForeignKey("PublicMessageId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Listing_Queue_BackgroundServices.Data.UserProfile", "UserProfile")
                        .WithMany("PostComments")
                        .HasForeignKey("UserProfileId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("PrivateMessage");

                    b.Navigation("PublicMessage");

                    b.Navigation("UserProfile");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.PrivateMessage", b =>
                {
                    b.HasOne("Listing_Queue_BackgroundServices.Data.GroupProfile", "GroupProfile")
                        .WithMany("PrivateMessages")
                        .HasForeignKey("GroupProfileId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Listing_Queue_BackgroundServices.Data.UserProfile", "UserProfile")
                        .WithMany("PrivateMessages")
                        .HasForeignKey("UserProfileId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("GroupProfile");

                    b.Navigation("UserProfile");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.PublicMessage", b =>
                {
                    b.HasOne("Listing_Queue_BackgroundServices.Data.UserProfile", "UserProfile")
                        .WithMany("PublicMessages")
                        .HasForeignKey("UserProfileId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("UserProfile");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.GroupProfile", b =>
                {
                    b.Navigation("PrivateMessages");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.PrivateMessage", b =>
                {
                    b.Navigation("PostComments");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.PublicMessage", b =>
                {
                    b.Navigation("PostComments");
                });

            modelBuilder.Entity("Listing_Queue_BackgroundServices.Data.UserProfile", b =>
                {
                    b.Navigation("PostComments");

                    b.Navigation("PrivateMessages");

                    b.Navigation("PublicMessages");
                });
#pragma warning restore 612, 618
        }
    }
}
