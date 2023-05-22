      program read_vector_from_file
      implicit none
      integer :: n, i, status
      real :: sum
      real, dimension(:), allocatable :: vector
      character(len=50) :: file_name
      integer :: unit_num


      ! Open the file for reading
      open(1, file='DATASET/1k.dat')



      end program read_vector_from_file
